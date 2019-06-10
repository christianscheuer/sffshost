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

# Installing some start data
echo "** Installing Data **"
echo '{
    "testuser": {
        "email": "test@soundflow.org",
        "password": "password",
        "displayName": "Test",
        "photoURL": ""
    }
}' > sfdata/data/auth.json
echo '{    
}' > sfdata/data/publishedPackagesIndex.json
echo '{    
}' > sfdata/data/publishedPackagesBetaIndex.json

echo "Now please follow instructions from SoundFlow to allow SSH access so we can upload the container"
