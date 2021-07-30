#!/usr/bin/zsh
minikube start --driver=virtualbox --bootstrapper=kubeadm\
	--extra-config=kubelet.authentication-token-webhook=true\
	--extra-config=apiserver.service-node-port-range=3000-35000
minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable metallb
export IP=$(minikube ip)
export IP_main=$IP
cub=$(echo $IP | grep -Eo "[0-9]+$")
IP=$(echo $IP | sed -e "s/\.[0-9]\+$//")
nmap -sP -PR $IP.$cub | grep -q "Host is up"
while [ "$?" != 1 ]
do
	cub=$(($cub + 1))
	nmap -sP -PR $IP.$cub | grep -q "Host is up"
done
export IP="$IP.$cub"
(echo $IP)
eval $(minikube -p minikube docker-env)
docker ps | grep -q kube-system
while [ "$?" != 0 ]
do
eval $(minikube -p minikube docker-env)
docker ps | grep -q kube-system
done
cd srcs
images=(ftps wordpress nginx phpmyadmin mysql grafana influxdb)
for image in $images
do
	docker build -t $image $image
	if [ $? != 0 ]
	then
		exit $?
	fi
done
cd kustomization
export WPPORT=5050
export PMAPORT=5000
export FTPPORT=41234
envsubst '{$IP},{$WPPORT}' < wordpress.yaml > .wordpress.yaml
envsubst '{$IP},{$WPPORT},{$PMAPORT}' < nginx.yaml > .nginx.yaml
envsubst '{$IP},{$PMAPORT}' < phpmyadmin.yaml > .phpmyadmin.yaml
envsubst '{$IP},{$FTPPORT}' < ftps.yaml > .ftps.yaml
envsubst '{$IP}' <  grafana.yaml > .grafana.yaml
envsubst '{$IP_main}' <  influxdb.yaml > .influxdb.yaml
kubectl apply -k .
echo "Use $IP to manage services"
cd ../..
echo "#!/usr/bin/zsh" > restart.sh
echo "kubectl delete -k srcs/kustomization" >> restart.sh
awk '(NR>7 && NR<49)' setup.sh >> restart.sh
chmod +x restart.sh
chmod -x setup.sh