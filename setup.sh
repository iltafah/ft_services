#!/bin/sh
eval $(minikube -p minikube docker-env)
docker build srcs/Ftps/. -t ftps
docker build srcs/Grafana/. -t grafana
docker build srcs/InfluxDB/. -t influxdb
docker build srcs/Mysql/. -t mysql
docker build srcs/Phpmyadmin/. -t phpmyadmin
docker build srcs/WordPress/. -t wordpress
docker build srcs/nginx/. -t nginx

 kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
 kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
 kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

#kubectl apply -k srcs/yaml_files/.
#sleep 30
#kubectl apply -f srcs/yaml_files/secret-config.yaml
kubectl apply -f srcs/yaml_files/mysql_dep.yaml
kubectl apply -f srcs/yaml_files/phpmyadmin_dep.yaml
kubectl apply -f srcs/yaml_files/influxdb_dep.yaml
kubectl apply -f srcs/yaml_files/nginx_dep.yaml
kubectl apply -f srcs/yaml_files/grafana_dep.yaml
kubectl apply -f srcs/yaml_files/ftps_dep.yaml
kubectl apply -f srcs/yaml_files/wordpress_dep.yaml
kubectl apply -f srcs/yaml_files/loadbalancer_conf.yaml

#kubectl apply -k srcs/yaml_files/.
