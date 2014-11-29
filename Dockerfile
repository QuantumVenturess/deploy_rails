# Dockerfile for installing and running Nginx

# Select ubuntu as the base image
FROM ubuntu

# Install Nginx
RUN apt-get update
RUN apt-get install -y nginx
RUN echo "daemon off;" >> /etc/ngnix/ngnix.conf

# Publish port 80
EXPOSE 80

# Start Nginx when container starts
ENTRYPOINT /usr/sbin/nginx
