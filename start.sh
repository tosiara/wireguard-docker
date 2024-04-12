#!/bin/bash

docker run -d \
	-v "$WIREGUARD_DATA:/app" \
	--cap-add=NET_ADMIN \
	--cap-add=SYS_MODULE \
	--device /dev/net/tun:/dev/net/tun \
	-p 51820:51820/udp \
	--sysctl="net.ipv4.conf.all.src_valid_mark=1" \
	--workdir /app \
	wireguard \
	bash /app/wg.sh

