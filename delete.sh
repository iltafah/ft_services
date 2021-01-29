
kubectl delete deployments --all
kubectl delete services --all
kubectl delete -f ./srcs/yaml_files/wordpress_dep.yaml
kubectl delete -f ./srcs/yaml_files/mysql_dep.yaml
