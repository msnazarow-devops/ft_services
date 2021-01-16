# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sgertrud <msnazarow@gmail.com>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/24 03:36:49 by sgertrud          #+#    #+#              #
#    Updated: 2021/01/14 04:06:39 by sgertrud         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine
EXPOSE 3606
RUN apk update && apk  upgrade
RUN apk add -q --no-cache wget mysql mysql-client procps openrc
COPY srcs/ .
RUN chmod +x *.sh
RUN sed -i "s/\[mysqld\]$/\[mysqld\]\nbind-address = 0.0.0.0/" /etc/my.cnf
RUN sed -i "s|!includedir /etc/my.cnf.d$|#!includedir /etc/my.cnf.d|" /etc/my.cnf
CMD [ "sh", "mysql.sh"]
