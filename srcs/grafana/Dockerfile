# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sgertrud <msnazarow@gmail.com>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/17 13:06:53 by sgertrud          #+#    #+#              #
#    Updated: 2021/01/18 18:41:40 by sgertrud         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

WORKDIR /usr/share/grafana

RUN apk update
RUN apk add grafana --repository http://nl.alpinelinux.org/alpine/edge/community/

#COPY dashboards/ /usr/share/grafana/public/dashboards/

EXPOSE 3000
COPY srcs/dashboards.yml /usr/share/grafana/conf/provisioning/dashboards/
COPY srcs/datasources.yml /usr/share/grafana/conf/provisioning/datasources/
COPY srcs/custom.ini /usr/share/grafana/conf
COPY srcs/dashboards /usr/share/grafana/public/dashboards/
CMD ["grafana-server", "web"]