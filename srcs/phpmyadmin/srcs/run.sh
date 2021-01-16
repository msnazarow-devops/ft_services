sed -i -e "s/\$server_port/$server_port/" "${nginx_location}"
sh mysupervisor.sh