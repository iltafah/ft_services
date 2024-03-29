#!/bin/sh

nc='\033[0m'

# Bold High Intensity
blc='\033[1;90m'      # Black
red='\033[1;91m'        # Red
grn='\033[1;92m'      # Green
yel='\033[1;93m'     # Yellow
blu='\033[1;94m'       # Blue
purp='\033[1;95m'     # Purple
cyan='\033[1;96m'       # Cyan
white='\033[1;97m'      # White

#special colors
scyan='\e[38;05;14m'
sblue='\e[38;05;39m'
sbrown='\e[38;05;82m'

#gradient colors
sc1='\e[38;05;154m'
sc2='\e[38;05;155m'
sc3='\e[38;05;156m'
sc4='\e[38;05;157m'
sc5='\e[38;05;158m'
sc6='\e[38;05;159m'

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
line5=$(tput cuu 5)
line6=$(tput cuu 6)
line7=$(tput cuu 7)

function loadbar () {
    
    start=5
    end=100
    bar_count=$((end / 5))


    echo "${nc}    ---------- __o  "
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


function dockerfile_loadbar () {

    printf "${scyan}               .                                                               ${sc6}_\____ \n";
    printf "${scyan}              ':'                                                             ${sc5}|_===__\`.        ==/ \n";
    printf "${sblue}|\"\/\"|     ____${scyan}:${sblue}___                                                           ${sc4}\/  '---\"\ _ _ _ _/\n";
    printf "${sblue} \  /    .\`📦📦    ',                                                   ${sc3}______/_______/_|_|_|_|_| \n";
    printf "${sblue} |  \___/  📦📦  O  |                                                 ${sc2}_|📦📦📦📦📦📦📦📦📦📦==.\" \n";                                                              
    printf "${scyan}~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~${sc1}\____________________.'\n";               
    printf "${purp}Progress : ${blu}|%s|[0]%%%2s\n"
    


    SUB='Step'
    docker build srcs/$1 -t $1 | while read line ;
    do 
        line=$(echo ${line} | grep -o 'Step [0-9]*/[0-9]*')
        if [[ "$line" == *"$SUB"* ]];
        then
            start=$(echo ${line} |  grep -o "[0-9]*/[0-9]*" | grep -o '^[0-9]*')
            end=$(echo ${line} |  grep -o "[0-9]*$")
            ratio=$((100 / end))
            if [ $start -ne $end ]
            then
                perc=$((start * ratio))
            else
                perc=100
            fi
            spaces=$((perc / 2))
            bar_count=$((100 / 5))
            bar_pos=$((perc / 5))
            bar_spaces=$((bar_count - bar_pos))
            fill=$(printf  "▇%.0s" $(seq 1 $bar_pos))
            ship_spaces=$((49 - spaces))
            printf "${line7}${lineclr}${scyan}%${spaces}s               .";                                     printf "%${ship_spaces}s              ${sc6}_\____ \n";                                
            printf "${lineclr}${scyan}%${spaces}s              ':'";                                            printf "%${ship_spaces}s            ${sc5}|_===__\`.        ==/ \n";                       
            printf "${lineclr}${sblue}%${spaces}s|\"\/\"|     ____${scyan}:${sblue}___";                        printf "%${ship_spaces}s          ${sc4}\/  '---\"\ _ _ _ _/\n";              
            printf "${lineclr}%${spaces}s${sblue} \  /    .\`📦📦    ',";                                       printf "%${ship_spaces}s  ${sc3}______/_______/_|_|_|_|_| \n";                                             
            printf "${lineclr}%${spaces}s${sblue} |  \___/  📦📦  O  |";                                        printf "%${ship_spaces}s${sc2}_|📦📦📦📦📦📦📦📦📦📦==.\" \n";                                         
            printf "${lineclr}${scyan}~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~"; printf "${sc1}\____________________.'\n";
            printf "${lineclr}${purp}Progress : ${blu}|${grn}${fill}${nc}%${bar_spaces}s${blu}|${nc}[${perc}]${red}%%${nc}\n"
        fi
    done;
    printf "${line7}${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${line7}"; #for some reason I couldn't make "tput ed" work on my mac"
}


printf "\n\n${purp}🔥,-*' ^ '~*-.,_,.-*~ ${grn}S͓̽T͓̽A͓̽R͓̽T͓̽I͓̽N͓̽G͓̽ ͓̽M͓̽I͓̽N͓̽I͓̽K͓̽U͓̽B͓̽E͓̽ ${purp}~*-.,_,.-*~' ^ '*-,🔥\n\n"

    minikube delete --all              &> /dev/null
    minikube config set cpus 2        &> /dev/null
    minikube config set memory 4000   &> /dev/null
    echo ${grn}
    minikube start
    echo ${nc}


eval $(minikube -p minikube docker-env)


printf "\n\n${purp}🔥,-*' ^ '~*-.,_,.-*~ ${grn}B͓̽U͓̽I͓̽L͓̽D͓̽I͓̽N͓̽G͓̽ ͓̽I͓̽M͓̽A͓̽G͓̽E͓̽S͓̽ ${purp}~*-.,_,.-*~' ^ '*-,🔥\n\n"

printf "${yel}Building Phpmyadmin Image\n"
dockerfile_loadbar "phpmyadmin"
printf "${line1}${lineclr}${grn}✔ Phpmyadmin Image has been created successfully ツ\n"

printf "${yel}Building Influxdb Image\n"
dockerfile_loadbar "influxdb"
printf "${line1}${lineclr}${grn}✔ Influxdb Image has been created successfully ツ\n"

printf "${yel}Building Mysql Image\n"
dockerfile_loadbar "mysql"
printf "${line1}${lineclr}${grn}✔ Mysql Image has been created successfully ツ\n"

printf "${yel}Building FTPS Image\n"
dockerfile_loadbar "ftps"
printf "${line1}${lineclr}${grn}✔ FTPS Image has been created successfully ツ\n"

printf "${yel}Building Nginx Image\n"
dockerfile_loadbar "nginx"
printf "${line1}${lineclr}${grn}✔ Nginx Image has been created successfully ツ\n"

printf "${yel}Building Grafana Image\n"
dockerfile_loadbar "grafana"
printf "${line1}${lineclr}${grn}✔ Grafana Image has been created successfully ツ\n"

printf "${yel}Building Wordpress Image\n"
dockerfile_loadbar "wordpress"
printf "${line1}${lineclr}${grn}✔ Wordpress Image has been created successfully ツ\n"



printf "\n\n${purp}🔥,-*' ^ '~*-.,_,.-*~ ${grn}D͓̽E͓̽P͓̽L͓̽O͓̽Y͓̽I͓̽N͓̽G͓̽ ͓̽S͓̽E͓̽R͓̽V͓̽I͓̽C͓̽E͓̽S͓̽ ${purp}~*-.,_,.-*~' ^ '*-,🔥\n\n"


printf "${yel}Configuring Loadbalancer\n"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > /dev/null 2>&1
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml > /dev/null 2>&1
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null 2>&1
kubectl apply -f srcs/yaml_files/loadbalancer_conf.yaml > /dev/null 2>&1
loadbar
printf "${line1}${lineclr}${grn}✔ Loadbalancer has been created successfully ツ\n"

printf "${yel}Configuring Influxdb\n"
kubectl apply -f srcs/yaml_files/influxdb_dep.yaml > /dev/null 2>&1
loadbar
printf "${line1}${lineclr}${grn}✔ Influxdb has been created successfully ツ\n"

printf "${yel}Configuring Mysql\n"
kubectl apply -f srcs/yaml_files/mysql_dep.yaml > /dev/null 2>&1
loadbar
printf "${line1}${lineclr}${grn}✔ Mysql has been created successfully ツ\n"

printf "${yel}Configuring Phpmyadmin\n"
kubectl apply -f srcs/yaml_files/phpmyadmin_dep.yaml > /dev/null 2>&1
loadbar
printf "${line1}${lineclr}${grn}✔ PMA has been created successfully ツ\n"
printf "${nc}"

printf "${yel}Configuring FTPS\n"
kubectl apply -f srcs/yaml_files/ftps_dep.yaml > /dev/null 2>&1
loadbar
printf "${line1}${lineclr}${grn}✔ FTPS has been created successfully ツ\n"


printf "${yel}Configuring Nginx\n"
kubectl apply -f srcs/yaml_files/nginx_dep.yaml > /dev/null 2>&1
loadbar
printf "${line1}${lineclr}${grn}✔ Nginx has been created successfully ツ\n"

printf "${yel}Configuring Grafana\n"
kubectl apply -f srcs/yaml_files/grafana_dep.yaml > /dev/null 2>&1
loadbar
printf "${line1}${lineclr}${grn}✔ Grafana has been created successfully ツ\n"

printf "${yel}Configuring Wordpress\n"
kubectl apply -f srcs/yaml_files/wordpress_dep.yaml > /dev/null 2>&1
loadbar
printf "${line1}${lineclr}${grn}✔ Wordpress has been created successfully ツ\n"

 
printf "${purp}👉  To run the dashboard, run the following command: ${cyan}\"minikube dashboard\"${nc}\n"

curl -s https://iterm2.com/utilities/imgcat | bash /dev/stdin ./srcs/ScriptDesign/kube.jpeg

minikube dashboard

###############################################   
## To log in wordpress and other platforms : ##
## User : iltafah                            ##
## Pass : 1337                               ##
###############################################
