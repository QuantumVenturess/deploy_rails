# Dockerfile for installing and running Nginx

# Select ubuntu as the base image
FROM ubuntu:12.04

# Install Nginx, NodeJS, and Curl
RUN apt-get update -q
RUN apt-get install -qy nginx
RUN apt-get install -qy curl
RUN apt-get install -qy nodejs
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Install rvm, ruby, bundler
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.0"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# Publish port 80
EXPOSE 80

# Start Nginx when container starts
ENTRYPOINT /usr/sbin/nginx
