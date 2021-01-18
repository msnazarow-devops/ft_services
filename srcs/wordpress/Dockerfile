# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sgertrud <msnazarow@gmail.com>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/24 03:36:49 by sgertrud          #+#    #+#              #
#    Updated: 2021/01/17 09:33:14 by sgertrud         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
EXPOSE 22 80 443
ARG nginx_location="/etc/nginx/conf.d/default.conf"
ENV nginx_location="${nginx_location}"
RUN apk  update && apk  upgrade
RUN apk add -q --no-cache nginx wget php-fpm openssl mysql-client
RUN apk add -q --no-cache php-common php-xmlrpc php-soap php-gd php-intl php-cli php-ldap php-zip php-curl php-phar php-json php-mysqli php-mbstring php-phar php-sodium php-openssl pcre php-dom php-exif php-fileinfo
RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School 21/CN=sgertrud"
WORKDIR /etc/setup
RUN wget -q https://wordpress.org/latest.tar.gz https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY srcs/ .
RUN chmod +x *.sh wp-cli.phar
RUN mv localhost.conf "${nginx_location}" && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/run/php && mkdir -p /run/nginx
RUN echo "clear_env = no" >>/etc/php7/php-fpm.conf && echo "clear_env = no" >>/etc/php7/php-fpm.d/www.conf
CMD [ "sh", "run.sh" ]
