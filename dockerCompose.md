# Docker Compose

## Install
### Ubuntu
* https://docs.docker.com/compose/install/#install-compose
* https://github.com/docker/compose/issues/5808

## Configuration
* docker-compose.yml
```
version: '2'
services:
 srv:
  # build . # this will build container from Dockerfile if it hasn't been built
  # If you have made changes to the Dcokerfile or image you need to run docker-compose build so that it updates everything
  image: python:2-slim
  command: python -m SimpleHTTPServer 8080
  ports:
   - 127.0.0.1:<PC Port>:<Internal docker port>
  volumes:
   - ./web:/html:ro 
# left side is the path from reference of the docker-compose file and right side indicates html root folder
# ro is read only on this volume
  working_dir: /html # so don't see in browser the folder html then 
```

* docker-compose.yml
```
services:
 dude:
  image: alpine
  command: tail -f / var/log/messages # keeps this docker alive
  networks:
   - soup
 bud:
  image: alpine
  command: ping -c 1 dude
  # command: ping -c 1 cooldude
  links:
   - dude: cooldude
  networks:
   - soup
networks:
 soup
```

## Usage
```
docker-compose build
docker-compose up -d # kills everything and restarts dokcer and reads docker compose file and starts fresh containers i.e. no old state

docker-compose start # uses old state
docker-compose stop # doesn't delete state

docker compose down # nukes old container and state

docker-compose logs -f <name of service e.g. oracle NOT CONTAINER NAME (hint: use tab)>

docker-compose ps
```
