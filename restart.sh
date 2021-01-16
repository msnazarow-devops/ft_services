#!/usr/bin/zsh
kubectl delete -k srcs/kustomization
export IP=$(minikube ip)
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
images=(ftps wordpress nginx phpmyadmin mysql)
for image in $images
do
	docker build -t $image $image
	if [ $? != 0 ]
	then
		exit 1
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
kubectl apply -k .
