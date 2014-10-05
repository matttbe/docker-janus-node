# Docker Janus Node

This repository contains a Dockerfile and configuration file to build Janus Node, a privacy and compression proxy developed by Mozilla.

About Janus:

* https://wiki.mozilla.org/Mobile/Janus
* https://github.com/mozilla/node-janus

## How to pull already built images?

If you don't want to build it, simply pull the image:

````
sudo docker pull matttbe/janus-node
````

## How to build?

It's maybe better to build it by yourself (to be sure that you're using the latest stable version of all packages).

### Clone this repository:

     git clone https://github.com/matttbe/docker-janus-node.git
     cd docker-janus-node


### Settings
If you need to change some settings, do it now by editing `default.yml` file (I just reduced the output messages compared to the original `default.yml` file)

### Keys and certificate
You will need to add your own key and certificate. If you want to use yours, simply launch the `genkey.sh` script or:

    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.pem -out crt.pem

The most important point is to correctly set the CD attribute with your server FQDN, e.g. `example.com`:

    Common Name (e.g. server FQDN or YOUR name) []:example.com

### Build docker image
Now you build the image by using `build.sh` script or:

    sudo docker build -t matttbe/janus-node .


## How to launch it?
You can simply launch it as any other docker image but don't forget to redirect ports, e.g.:

    sudo docker run -d -p 0.0.0.0:55055:55055 -p 0.0.0.0:55155:55155 -P --name janus matttbe/janus-node

