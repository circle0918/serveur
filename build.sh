docker kill test0
docker rm test0
docker rmi yy0
docker build -t yy0 .
docker run --name test0 -d -p 80:80 -p 443:443 -it yy0 /bin/bash
docker exec -it test0 bash
