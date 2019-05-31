#!/bin/bash

# Install Docker
echo "** Installing Docker **"
sudo apt -y update
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt -y update
sudo apt -y install docker-ce
sudo usermod -aG docker ${USER}

# Install Docker Compose
echo "** Installing Docker Compose **"
sudo curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Making sfdata dir
mkdir -p sfdata
mkdir -p sfdata/data

echo "Now you need to install the container and the data"
