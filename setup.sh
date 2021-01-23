#!/bin/sh
eval $(minikube docker-env)
docker build /Users/iltafah/Desktop/Ft_services/srcs/Ftps/. -t my_ftps
docker build srcs/Grafana/. -t my_grafana
docker build srcs/InfluxDB/. -t my_influxdb
docker build srcs/Mysql/. -t my_mysql
docker build srcs/Phpmyadmin/. -t my_phpmyadmin
docker build srcs/WordPress/. -t my_wordpress
docker build srcs/nginx/. -t my_nginx

kubectl delete -f srcs/yaml_files/nginx_dep.yaml
kubectl delete -f srcs/yaml_files/phpmyadmin_dep.yaml
kubectl delete -f srcs/yaml_files/wordpress_dep.yaml
kubectl delete -f srcs/yaml_files/grafana_dep.yaml
kubectl delete -f srcs/yaml_files/ftps_dep.yaml
kubectl delete -f srcs/yaml_files/mysql_dep.yaml
kubectl delete -f srcs/yaml_files/influxdb_dep.yaml


kubectl apply -f srcs/yaml_files/nginx_dep.yaml
kubectl apply -f srcs/yaml_files/phpmyadmin_dep.yaml
kubectl apply -f srcs/yaml_files/wordpress_dep.yaml
kubectl apply -f srcs/yaml_files/grafana_dep.yaml
kubectl apply -f srcs/yaml_files/ftps_dep.yaml
kubectl apply -f srcs/yaml_files/mysql_dep.yaml
kubectl apply -f srcs/yaml_files/influxdb_dep.yaml
