#!/usr/bin/zsh
#minikube start --vm-driver=virtualbox
#minikube addons enable dashboard
#minikube addons enable metrics-server
#kubectl delete namespaces metallb-system
#minikube addons disable metallb
#minikube addons enable metallb
export IP=$(minikube ip)
cub=$(echo $IP | grep -Eo "[0-9]+$")
IP=$(echo $IP | sed -e "s/\.[0-9]\+$//")
nmap -sP -PR $IP.$cub | grep "Host is up"
while [ "$?" != 1 ]
do
	cub=$(($cub + 1))
	nmap -sP -PR $IP.$cub | grep "Host is up"
done
IP="$IP.$cub"
echo $IP
eval $(minikube -p minikube docker-env)
docker build -t mywordpress srcs/wordpress
docker build -t mynginx srcs/nginx
docker build -t myphpmyadmin srcs/phpmyadmin
docker build -t mymysql srcs/mysql
kubectl apply -f metallb.yaml
kubectl delete -k test
#kubectl delete -f srcs/wordpress/wordpress.yaml
sed -i -e "s/loadBalancerIP:[ A-Z{}a-z0-9.]*/loadBalancerIP: $IP/" test/mysql.yaml test/wordpress.yaml test/nginx.yaml test/phpmyadmin.yaml
sleep 30;
kubectl apply -k test
#kubectl apply -f srcs/wordpress/wordpress.yaml
#kubectl apply -f mysql-deployment.yaml