# Docker

## Installation & Configuration & Upgrade & Uninstall
* https://docs.docker.com/engine/installation/linux/ubuntulinux/

## Setup on Ubuntu
* https://docs.docker.com/engine/installation/linux/ubuntulinux/
### Run without sudo
```
sudo groupadd docker
sudo usermod -aG docker $USER
# Log out or reboot
docker run hello-world # if this works then you are all set
```

## Service, Container And Image Management
* https://docs.docker.com/engine/reference/commandline/
```
# NOTE: Only use sudo if you have set it up to run as root! This is default on ubuntu

$ sudo service docker start
$ sudo service docker stop

$ sudo docker version
$ sudo docker ps # check if there are any running containers
$ sudo docker ps -a # show all containers on the system
$ sudo $ docker ps -l # show details of last container started
$ sudo docker ps -s # check the size of the containers
$ sudo docker history centos:centos7 # on host show size of image layers
# NOTE:
# Images are stored in layers so that they can be used by other images and resources shared etc.
$ sudo docker history centos:centos7

$ sudo docker images # show local images
$ sudo docker rmi -f 7d9495d03763 # delete image by ID
$ docker rmi -f docker-whale # delete image by name
 
$ sudo docker run hello-world # runs image hello-world
# NOTE: if image is not found locally, docker will look for it on docker hub and download it

$ sudo docker run -it ubuntu /bin/bash # run an ubuntu container
# NOTE:
# run starts a new container
# ubuntu is the image we want to run
# /bin/bash - runs a bash shell in your container
# -i => STDIN kept open even though it may not be attached,
#       by default this is false, you need for the cmd line for bash
# -t => pseudo-TTY is allocated, by default this is false
$ sudo docker run -t -i ubuntu:12.04 /bin/bash
# 12.04 is the version - image tag
# default is to use latest

$ docker exec -it container-id sh -c "cd install && cd tomcat && ls"
# RUNS SHELL COMMANDS ON EXISTING RUNNING CONTAINER!!!!!

$ sudo docker run -d ubuntu /bin/sh -c "while true; do echo hello world; sleep 1; done"
# NOTE:
# Creates a container that runs as a background process
# Output is a long string which is the container id
$ sudo docker logs <CONTAINER ID / NAMES> # see logs of the specified container
$ sudo docker logs -f <CONTAINER ID / NAMES> # like tail -f
$ sudo docker stop <CONTAINER ID / NAMES> # stops specified container
$ sudo docker port <CONTAINER ID / NAMES> 5000 # external port mapped to this docker conatiner port
$ sudo docker top <CONTAINER ID / NAMES> # processes running in the container
$ sudo docker inspect <CONTAINER ID / NAMES> # returns json doc of useful configs
$ sudo docker rm <CONTAINER ID / NAMES> # remove container id
$ sudo docker pull <IMAGE NAME> # pulls latest image

$ sudo docker run -d -p 80:5000 training/webapp python app.py
# Map port 5000 of container to localhost port 80
# docker ps -l
# PORTS
# 0.0.0.0:80->5000/tcp
```

## Networking
* By default docker has 3 networks
 * none
 * host
 * bridge - unless told otherwise by default docker uses this network
```
# NOTE: By default docker launches containers on the BRIDGE network
$ sudo docker network ls # list of containers and what network they are using
$ sudo docker network inspect bridge # detailed info around the "bridge" network
$ sudo docker run -itd --name=networktest ubuntu
$ sudo docker network disconnect bridge networktest # disconnect container from network

$ sudo docker network create -d bridge my-bridge-network
# NOTE:
# creates a new network
# "-d bridge" - use the bridge driver
$ sudo docker network inspect my-bridge-network
# NOTE:
# lots of info and what containers are in it
$ sudo docker run -d --net=my-bridge-network --name db training/postgres
# NOTE:
# launch this container in "my-bridge-network" network
$ sudo docker inspect --format='{{json .NetworkSettings.Networks}}'  db
# NOTE:
# info in JSON format

$ sudo docker run -d --name web training/webapp python app.py
$ sudo docker inspect --format='{{json .NetworkSettings.Networks}}'  web
# NOTE:
# json info showing default net of bridge
$ sudo docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' web
# NOTE:
# shows IP Address of app running in container
$ sudo docker exec -it db bash # opens shell to "db" container

$ sudo docker network connect my-bridge-network web
# NOTE:
# can attach a container to as many networks as one likes
```
## Data Management in Containers
```
$ sudo docker run -d -P --name web -v /webapp training/webapp python app.py
# NOTE:
# -v => add data volume to container (docker run & create commands)
#       can be used several times for several volumes
# Creates new volume inside container at /webapp

```

## Build your own image
* https://docs.docker.com/engine/tutorials/dockerimages/#/creating-our-own-images
* https://docs.docker.com/engine/getstarted/step_four/
```
$ sudo docker build -t docker-whale .
# NOTE: -t is for naming and optionally tagging the image name:tag
```
* Tag your image id
```
$ sudo docker tag 7d9495d03763 maryatdocker/docker-whale:latest
# NOTE:
# 7d9495d03763 - is the image ID
# maryatdocker - docker hub username
# docker-whale - image name
# latest - label, version or tag
```

# Docker Hub
* https://hub.docker.com/explore/ - Official repositories

## Notes
* Anatomy of a docker command: docker run hello-world
 * docker - docker command
 * run - a child command for creating and running a container
 * hello-world - tells docker what image to lad in the container
