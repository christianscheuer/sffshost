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

# Install curl (for testing purposes)
apk add curl

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

echo ""
echo ""

# Make sure we log out IP address
echo "Now run this command on SF dev computer:"
SFFSIP=$(ip addr | grep eth0 | grep inet | sed -r 's/inet//' | sed 's/\/.*//' | xargs)
echo "in pkg/sffs: jake send, enter IP: $SFFSIP"

echo ""
echo "When done transferring, do this in VM: cd /opt/sffs && ./start.sh"
