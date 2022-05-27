FROM ubuntu:latest

RUN apt update &&\
apt upgrade -y &&\
apt install openssh-server -y &&\
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config &&\
service ssh start &&\
echo 'root:password' | chpasswd
