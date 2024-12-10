## Build
* Build the docker image
```
$ sudo docker build -t eg_apache_cassandra .
```

## Run
* Run the apache-cassandra container
```
# Non-persistent mode
$ sudo docker run --rm -P --name ac_test eg_apache_cassandra
# NOTE: --rm removes the container and image when container exit successful

# Persistent mode
$ sudo docker run -P --name ac_test eg_apache_cassandra
$ sudo docker run -d -P --name ac_test eg_apache_cassandra # runs in background
```

## Access
```
# simple cqlsh access once logged into bash
$ docker exec -it ac_test bash
> cqlsh

## access from another env
$ export CQLSH_HOST='127.0.0.1'
$ export CQLSH_PORT='32779' # use docker ps to find port
$ cqlsh

```

## References
* https://store.docker.com/images/53ad54dd-9bd8-48cd-89b4-fc1d5fdfa6cc?tab=description
* https://hub.docker.com/_/cassandra/