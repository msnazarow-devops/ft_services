# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sgertrud <msnazarow@gmail.com>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/24 03:36:49 by sgertrud          #+#    #+#              #
#    Updated: 2021/01/10 05:53:39 by sgertrud         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
EXPOSE 22 80 443
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y nginx wget php-fpm
RUN apt-get install -y php-common php-mbstring php-xmlrpc php-soap php-gd php-intl php-mysql php-cli php-ldap php-zip php-curl
RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School 21/CN=sgertrud"
WORKDIR /var/www/
RUN wget https://wordpress.org/latest.tar.gz https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY srcs/ .
RUN chmod +x *.sh wp-cli.phar
RUN mv localhost.conf /etc/nginx/sites-available/default && mv wp-cli.phar /usr/local/bin/wp
CMD [ "bash", "run.sh" ]
