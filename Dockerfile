# janus-node
#
# VERSION 0.0.1

FROM ubuntu:14.04
MAINTAINER Matthieu Baerts "matttbe@gmail.com"

# Dependences
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y build-essential libav-tools nasm nodejs npm git libpng12-dev autoconf automake libtool nodejs-legacy

# Create user
RUN useradd -d /home/janus -m janus
USER janus
WORKDIR /home/janus

# Get node-janus
RUN git clone https://github.com/mozilla/node-janus

# Compile it
WORKDIR node-janus
RUN npm install

# Config
ADD default.yml /home/janus/node-janus/config/default.yml
ADD key.pem /home/janus/node-janus/keys/key.pem
ADD crt.pem /home/janus/node-janus/keys/crt.pem

# Launch
CMD ["./proxy"]

