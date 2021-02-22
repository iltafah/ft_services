#!/bin/sh


#minikube config set cpus 2
#minikube config set memory 5000
#minikube start



blc='\033[0;90m'       # Black
red='\033[0;91m'         # Red
grn='\033[0;92m'       # Green
yel='\033[0;93m'      # Yellow
blu='\033[0;94m'        # Blue
purp='\033[0;95m'      # Purple
white='\033[0;97m'       # White
nc='\033[0m'
cyan='\033[1;96m'

echo "${cyan}  █████▒▄▄▄█████▓     ██████ ▓█████  ██▀███   ██▒   █▓ ██▓ ▄████▄  ▓█████   ██████ ";
echo "▓██   ▒ ▓  ██▒ ▓▒   ▒██    ▒ ▓█   ▀ ▓██ ▒ ██▒▓██░   █▒▓██▒▒██▀ ▀█  ▓█   ▀ ▒██    ▒ ";
echo "▒████ ░ ▒ ▓██░ ▒░   ░ ▓██▄   ▒███   ▓██ ░▄█ ▒ ▓██  █▒░▒██▒▒▓█    ▄ ▒███   ░ ▓██▄   ";
echo "░▓█▒  ░ ░ ▓██▓ ░      ▒   ██▒▒▓█  ▄ ▒██▀▀█▄    ▒██ █░░░██░▒▓▓▄ ▄██▒▒▓█  ▄   ▒   ██▒";
echo "░▒█░      ▒██▒ ░    ▒██████▒▒░▒████▒░██▓ ▒██▒   ▒▀█░  ░██░▒ ▓███▀ ░░▒████▒▒██████▒▒";
echo " ▒ ░      ▒ ░░      ▒ ▒▓▒ ▒ ░░░ ▒░ ░░ ▒▓ ░▒▓░   ░ ▐░  ░▓  ░ ░▒ ▒  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░";
echo " ░          ░       ░ ░▒  ░ ░ ░ ░  ░  ░▒ ░ ▒░   ░ ░░   ▒ ░  ░  ▒    ░ ░  ░░ ░▒  ░ ░";
echo " ░ ░      ░         ░  ░  ░     ░     ░░   ░      ░░   ▒ ░░           ░   ░  ░  ░  ";
echo "                          ░     ░  ░   ░           ░   ░  ░ ░         ░  ░      ░  ";
echo "                                                  ░       ░                        ";
echo "${nc}"






lineclr=$(tput el)
line1=$(tput cuu1)
line2=$(tput cuu 2)
line3=$(tput cuu 3)
line4=$(tput cuu 4)

function loadbar {
    echo "${nc}"
    
    start=5
    end=100
    bar_count=$((end / 5))


    echo "    ---------- __o  "
    echo "   --------  _ \<,_ "
    echo " -------    (*)/ (*)"
    printf " Progress : |%${bar_count}s|[0]%%%2s\n"

    while [ $start -le $end ]; do
         bar_pos=$((start / 5))
         fill=$(printf  "▇%.0s" $(seq 1 $bar_pos))
         spaces=$((bar_count - bar_pos))

        printf "${cyan}"
        printf "${line4}${lineclr}%${bar_pos}s    ---------- __o  \n"
        printf "${lineclr}%${bar_pos}s   --------  _ \<,_ \n"
        printf "${lineclr}%${bar_pos}s -------    (*)/ (*)\n"           
        printf "${nc}"                                           
        printf "${lineclr}${purp}Progress : ${blu}|${grn}${fill}${nc}%${spaces}s${blu}|${nc}[${start}]${red}%%${nc}\n"
        ((start+=$(($RANDOM % 5))))
        if [ $start -gt 95 ] && [ $start -lt 100 ] 
        then
            ((start+=((100 - $start))))
        fi
        sleep $(printf %.1f "$(($RANDOM%5))e-1")
    done ;
    printf "${line4}${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${line4}"; #for some reason I couldn't make "tput ed" work on my mac"

}

if echo $(minikube status) | grep "host: Stopped";
then
    minikube start
fi

eval $(minikube -p minikube docker-env)
docker build srcs/Ftps/. -t ftps > /dev/null 2>&1
docker build srcs/Grafana/. -t grafana > /dev/null 2>&1
docker build srcs/InfluxDB/. -t influxdb > /dev/null 2>&1
docker build srcs/Mysql/. -t mysql > /dev/null 2>&1
docker build srcs/Phpmyadmin/. -t phpmyadmin > /dev/null 2>&1
docker build srcs/WordPress/. -t wordpress > /dev/null 2>&1
docker build srcs/Nginx/. -t nginx > /dev/null 2>&1
 
 
 
 printf "${yel}Configuring Loadbalancer\n"
 kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > /dev/null 2>&1
 kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml > /dev/null 2>&1
 # On first install only
 kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null 2>&1
 kubectl apply -f srcs/yaml_files/loadbalancer_conf.yaml > /dev/null 2>&1
 loadbar
 printf "${line2}${lineclr}${grn}✔ Loadbalancer has been created successfully ツ\n"

 printf "${yel}Configuring Influxdb\n"
 kubectl apply -f srcs/yaml_files/influxdb_dep.yaml > /dev/null 2>&1
 loadbar
 printf "${line2}${lineclr}${grn}✔ Influxdb has been created successfully ツ\n"

 printf "${yel}Configuring Mysql\n"
 kubectl apply -f srcs/yaml_files/mysql_dep.yaml > /dev/null 2>&1
 loadbar
 printf "${line2}${lineclr}${grn}✔ Mysql has been created successfully ツ\n"

 printf "${yel}Configuring FTPS\n"
 kubectl apply -f srcs/yaml_files/ftps_dep.yaml > /dev/null 2>&1
 loadbar
 printf "${line2}${lineclr}${grn}✔ FTPS has been created successfully ツ\n"

 printf "${yel}Configuring Nginx\n"
 kubectl apply -f srcs/yaml_files/nginx_dep.yaml > /dev/null 2>&1
 loadbar
 printf "${line2}${lineclr}${grn}✔ Nginx has been created successfully ツ\n"

 printf "${yel}Configuring Grafana\n"
 kubectl apply -f srcs/yaml_files/grafana_dep.yaml > /dev/null 2>&1
 loadbar
 printf "${line2}${lineclr}${grn}✔ Grafana has been created successfully ツ\n"

 printf "${yel}Configuring Phpmyadmin\n"
 kubectl apply -f srcs/yaml_files/phpmyadmin_dep.yaml > /dev/null 2>&1
 loadbar
 printf "${line2}${lineclr}${grn}✔ Phpmyadmin has been created successfully ツ\n"

 printf "${yel}Configuring Wordpress\n"
 kubectl apply -f srcs/yaml_files/wordpress_dep.yaml > /dev/null 2>&1
 loadbar
 printf "${line2}${lineclr}${grn}✔ Wordpress has been created successfully ツ\n"
 
 minikube dashboard
 