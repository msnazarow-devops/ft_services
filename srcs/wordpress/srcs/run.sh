
mkdir -p /var/run/php

sed -i -e "s/\$server_port/$server_port/" /etc/nginx/sites-available/default
echo "clear_env = no" >>/etc/php/7.3/fpm/php-fpm.conf
echo "clear_env = no" >>/etc/php/7.3/cli/php-fpm.conf
echo "clear_env = no" >>/etc/php/7.3/fpm/pool.d/www.conf
#service php7.3-fpm start  && service nginx start
bash wp_install2.sh
#service php7.3-fpm stop  && service nginx stop
supervisord -c supervisord.conf