#!/usr/bin/zsh
minikube start --vm-driver=virtualbox
minikube addons enable dashboard
minikube addons enable metrics-server
#minikube addons disable metallb
minikube addons enable metallb
export IP=$(minikube ip)
cub=$(echo $IP | grep -Eo "[0-9]+$")
IP=$(echo $IP | sed -e "s/\.[0-9]\+$//")
nmap -sP -PR $IP.$cub | grep "Host is up">/dev/null
while [ "$?" != 1 ]
do
	cub=$(($cub + 1))
	nmap -sP -PR $IP.$cub | grep "Host is up">/dev/null
done
export IP="$IP.$cub"
(echo $IP)
eval $(minikube -p minikube docker-env)
cd srcs
docker build -t mywordpress wordpress
docker build -t mynginx nginx
docker build -t myphpmyadmin phpmyadmin
docker build -t mymysql mysql
kubectl delete -k kustomization
cd kustomization
envsubst '{$IP}' < wordpress.yaml > .wordpress.yaml
envsubst '{$IP}' < nginx.yaml > .nginx.yaml
envsubst '{$IP}' < phpmyadmin.yaml > .phpmyadmin.yaml
kubectl apply -k .
echo "Use $IP to manage services"