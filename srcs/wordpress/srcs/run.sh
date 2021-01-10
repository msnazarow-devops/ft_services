mkdir -p /var/run/php
tar -xvzf latest.tar.gz && chown www-data:www-data -R wordpress
sed -i -e "s/\$server_port/$server_port/" /etc/nginx/sites-available/default
echo "clear_env = no" >>/etc/php/7.3/fpm/php-fpm.conf
echo "clear_env = no" >>/etc/php/7.3/cli/php-fpm.conf
echo "clear_env = no" >>/etc/php/7.3/fpm/pool.d/www.conf
bash wp_install.sh
bash mysupervisor.sh