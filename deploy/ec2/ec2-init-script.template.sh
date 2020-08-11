#!/bin/bash
sudo su

yum update -y

# Docker
yum install docker -y
service docker start
usermod -a -G docker ec2-user
newgrp docker

# Docker Compose
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | tee /usr/local/bin/docker-compose > /dev/null
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Allow port forwarding
echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config
echo "GatewayPorts yes" >> /etc/ssh/sshd_config
service sshd restart
if [ $? -eq 0 ]
then
    echo "Port forwarding activated."
fi

# export config

CLONE_COUNT="<<CLONE_COUNT>>"
TARGET_PORT="<<TARGET_PORT>>"
LISTEN_PORT="<<LISTEN_PORT>>"
TARGET_HOST="<<TARGET_HOST>>"

yum install -y git

su ec2-user

git clone https://github.com/solanoepalacio/webhook-forwarder code

cd code

docker-compose up --build webhook-forwarder


