# Install Docker
apk add docker
apk update
rc-update add docker boot
service docker start
service docker status
docker -v

# Install Docker Compose
apk add py-pip
apk add python-dev libffi-dev openssl-dev gcc libc-dev make
pip install --upgrade pip
pip install docker-compose

# Make sure we're in the right directory
cd /opt/sffs

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

# Setup SSH root login
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
/etc/init.d/sshd restart

echo "Now please follow instructions from SoundFlow to allow SSH access so we can upload the container"
# Make sure we log out IP address
echo "SoundFlow can now transfer Docker image to the VM via the following IP:"
ip addr | grep eth0 | grep inet | sed -r 's/inet//' | sed 's/\/.*//' | xargs

