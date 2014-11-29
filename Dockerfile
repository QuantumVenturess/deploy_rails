# Dockerfile for installing and running Nginx
# Dockerfile for a Rails application using Nginx and Unicorn

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
# -c run the command passed to the -c argument
RUN /bin/bash -c "source /etc/profile.d/rvm.sh"
# -l makes it a login shell so bash first reads /etc/profile
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.0"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# Add configuration files in repository to filesystem
ADD config/container/nginx-sites.conf /etc/nginx/sites-enabled/default
ADD config/container/start-server.sh /usr/bin/start-server
RUN chmod +x /usr/bin/start-server

# Add rails project to project directory
ADD ./ /rails

# set WORKDIR
WORKDIR /rails

# Bundle install
RUN /bin/bash -l -c "bundle install"

# Publish port 80
EXPOSE 80

# Start Nginx when container starts
# ENTRYPOINT /usr/sbin/nginx
ENTRYPOINT /usr/bin/start-server
