docker-compose up -d

echo "Checking if we're running properly: http://localhost:1790/urls"
curl http://localhost:1790/urls
