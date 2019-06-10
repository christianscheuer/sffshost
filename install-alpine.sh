# Install Docker
apk add docker
apk update
rc-update add docker #works better to add at default runlevel, not boot!
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

# Now patch inittab
echo '
# /etc/inittab

::sysinit:/usr/bin/clear
::sysinit:/bin/echo "Starting SoundFlow Facility Server..."
::sysinit:/sbin/openrc sysinit --quiet &>/dev/null
::sysinit:/sbin/openrc boot --quiet &>/dev/null
::wait:/sbin/openrc default --quiet &>/dev/null

# Set up a couple of gettys
tty1::respawn:/usr/bin/nano /etc/network/interfaces
tty2::respawn:/sbin/getty 38400 tty2

# Stuff to do for the 3-finger salute
::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
::shutdown:/usr/bin/clear
::shutdown:/sbin/openrc shutdown

' > /etc/inittab

# Now patch /boot/extlinux.conf
cat /boot/extlinux.conf | sed 's/AUTOBOOT Alpine/AUTOBOOT SFFS/' | sed 's/\(APPEND .*\)/\1 quiet loglevel=1 /' > /boot/extlinux.conf

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
echo "in pkg/sffs: jake send, enter IP: $SFFSIP, use password sffshost"

echo ""
echo "When done transferring, do this in VM: cd /opt/sffs && ./start.sh"

# Notes for networking:
# https://wiki.alpinelinux.org/wiki/Configure_Networking