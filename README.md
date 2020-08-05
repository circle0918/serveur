# serveur

docker build -t yy1 . (build image and name the image)
docker run --name test0 -it -p 80:80 -p 443:443 yy1 (rename container test0 and run image to build a container)
