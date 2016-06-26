# eval "$(docker-machine env)"
docker run -d \
     -p 2049:2049 \
     -v /home/docker:/export/docker \
     --name nfs \
     --hostname nfs \
     --privileged \
     pierophp/nfs
