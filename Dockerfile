# Dockerfile for installing and running Nginx

# Select ubuntu as the base image
FROM ubuntu:12.04

# Install Nginx
RUN apt-get update
RUN apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Publish port 80
EXPOSE 80

# Start Nginx when container starts
ENTRYPOINT /usr/sbin/nginx
