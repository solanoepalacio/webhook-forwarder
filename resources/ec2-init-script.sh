#!/bin/bash
sudo su
yum update -y
yum install docker -y
service docker start
usermod -a -G docker ec2-user
newgrp docker

curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | tee /usr/local/bin/docker-compose > /dev/null
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config
echo "GatewayPorts yes" >> /etc/ssh/sshd_config

service sshd restart

su ec2-user

echo "Port forwarding activated."