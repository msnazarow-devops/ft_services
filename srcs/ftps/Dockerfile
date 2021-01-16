# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sgertrud <msnazarow@gmail.com>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/24 03:36:49 by sgertrud          #+#    #+#              #
#    Updated: 2021/01/16 10:25:56 by sgertrud         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine
EXPOSE 20 21 
ARG IP="192.168.49.3"
ENV IP="${IP}"
RUN apk update && apk  upgrade
RUN apk add --no-cache vsftpd openssl
RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/selfsigned.key -out /etc/ssl/certs/selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School 21/CN=sgertrud"
COPY srcs/ .
RUN echo -e "admin\nadmin" | adduser msnazarow
CMD ["sh", "run.sh"]
