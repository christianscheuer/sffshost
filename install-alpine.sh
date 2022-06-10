# Include community repository for Alpine Linux 3.16
echo "http://dl-cdn.alpinelinux.org/alpine/v3.16/community" >> /etc/apk/repositories
apk update

# Install Docker + Docker Compose
apk add docker docker-compose
rc-update add docker #works better to add at default runlevel, not boot!
service docker start
service docker status
docker -v

# Install curl and nano (for testing and runtime purposes)
apk add curl nano
