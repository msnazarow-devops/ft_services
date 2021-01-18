# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sgertrud <msnazarow@gmail.com>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/17 13:06:46 by sgertrud          #+#    #+#              #
#    Updated: 2021/01/18 08:11:15 by sgertrud         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
EXPOSE 8086
RUN apk update
RUN apk add influxdb curl jq
RUN apk add telegraf --repository http://nl.alpinelinux.org/alpine/edge/community/
COPY srcs/ .

CMD ["sh", "mysupervisor.sh"]
