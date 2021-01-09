#!/usr/bin/zsh
#minikube start --vm-driver=virtualbox
#minikube addons enable dashboard
#minikube addons enable metrics-server
#kubectl delete namespaces metallb-system
#minikube addons disable metallb
#minikube addons enable metallb
export IP=$(minikube ip)
eval $(minikube -p minikube docker-env)
docker build -t onlywordpress srcs/wordpress
kubectl apply -f metallb.yaml
kubectl delete -k test
#kubectl delete -f srcs/wordpress/wordpress.yaml
sed -i -e "s/loadBalancerIP:[ A-Z{}a-z0-9.]*/loadBalancerIP: $IP/" test/mysql-deployment.yaml
sed -i -e "s/loadBalancerIP:[ A-Z{}a-z0-9.]*/loadBalancerIP: $IP/" test/wordpress-deployment.yaml
kubectl apply -k test
#kubectl apply -f srcs/wordpress/wordpress.yaml
#kubectl apply -f mysql-deployment.yaml