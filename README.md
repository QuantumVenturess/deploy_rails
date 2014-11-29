# Docker basics
https://docs.docker.com/articles/basics/

# Interactive shell
$ docker run -i -t ubuntu /bin/bash
$/# apt-get update
$/# apt-get install -y nginx
$/# exit

# Commit changes
$ docker commit -m "<Message>" <container_id> <repository>:<tag>

# Run Nginx in a container
Prevent docker from terminating container after Nginx master process exits
$ docker run <image_id> /bin/bash -lc 'echo "daemon off;" 
>> /etc/nginx/nginx.conf'
$ docker ps -l
$ docker commit -m "Turn off Nginx daemon mode" <container_id> <repo>:<tag>
$ docker images

Run Nginx as a service
`p 80:80` forwards the 80 port of host to the 80 port of the container
$ docker run -p 80:80 <image_id> /usr/sbin/nginx
$ docker ps
$ docker kill <container_id>

# Using Dockerfile
A configuration file for Docker, which specifies how to create your customized
container from a base image. Create a Dockerfil in root directory
```
$ # Build an image using the Dockerfile at current location
$ # Example: sudo docker build -t [name] .
$ sudo docker build -t my_mongodb .    
$ docker run -p 80:80 [tag_name]
```

# Upload to repository
```
$ docker build -t repo/name github.com/username/repo
$ docker run -p 80:80 repo/name
```

# Run container as a daemon
`$ docker run -d -p 80:80 [name]`
