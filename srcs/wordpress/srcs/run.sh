#!/bin/sh
tar -xzf latest.tar.gz
chmod 777 -R wordpress/
sed -i -e "s/\$server_port/$server_port/" "${nginx_location}"
sh wp_install.sh
sh mysupervisor.sh