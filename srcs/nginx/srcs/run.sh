sed -i -e "s/\$server_port/$server_port/" "${nginx_location}"
sed -i -e "s/\$WPPORT/$WPPORT/" "${nginx_location}"
sed -i -e "s/\$PMAPORT/$PMAPORT/" "${nginx_location}"

sh mysupervisor.sh