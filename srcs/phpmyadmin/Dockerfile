# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sgertrud <msnazarow@gmail.com>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/24 03:36:49 by sgertrud          #+#    #+#              #
#    Updated: 2021/01/18 08:59:30 by sgertrud         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
EXPOSE 80 443
ARG nginx_location="/etc/nginx/conf.d/default.conf"
ENV nginx_location="${nginx_location}"
RUN apk update && apk upgrade
RUN apk add -q --no-cache nginx wget php-fpm openssl
RUN apk add -q --no-cache  php-common php-mbstring php-xmlrpc php-soap php-gd php-intl php-cli php-ldap php-zip php-curl php-mysqli php-json php-session
RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School 21/CN=sgertrud"
WORKDIR /etc/setup
RUN wget -q https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar -xzf phpMyAdmin-5.0.2-all-languages.tar.gz  && mv phpMyAdmin-5.0.2-all-languages phpmyadmin
COPY srcs/ .
RUN sed -i "s/'localhost'/getenv('PMA_HOST')/" phpmyadmin/config.sample.inc.php && mv phpmyadmin/config.sample.inc.php phpmyadmin/config.inc.php
RUN sed -i "s/?>/$cfg['PmaAbsoluteUri'] = 'phpmyadmin:5000';?>/" phpmyadmin/config.inc.php
RUN chmod +x *.sh
RUN mv localhost.conf "${nginx_location}"
RUN echo "clear_env = no" >>/etc/php7/php-fpm.conf && \
	echo "clear_env = no" >>/etc/php7/php-fpm.d/www.conf
RUN mkdir -p /var/run/php && mkdir -p /run/nginx
CMD [ "sh", "mysupervisor.sh" ]
