FROM ubuntu:jammy

RUN apt-get update
RUN apt-get -y install wireguard iptables iproute2 tcpdump
RUN apt-get -y install iputils-ping

