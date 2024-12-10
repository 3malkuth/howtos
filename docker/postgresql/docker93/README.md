
## Build
* Build the docker image
```
$ sudo docker build -t eg_postgresql .
```

## Run
* Run the pgsql container
```
# Non-persistent mode
$ sudo docker run --rm -P --name pg_test eg_postgresql
# NOTE: --rm removes the container and image when container exit successful

# Persistent mode
$ sudo docker run -P --name pg_test eg_postgresql
$ sudo docker run -d -P --name pg_test eg_postgresql # runs in background
```

## Link container to another container's ports
* DEPRECATED: LINKING SHOULD NOT BE USED BUT THE NEW COMPOSE!!!!
 * https://docs.docker.com/compose/
 * https://rominirani.com/docker-tutorial-series-part-8-linking-containers-69a4e5bf50fb#.chbf1v6ln
```
$ sudo docker run --rm -t -i --link remote_name:local_alias eg_postgresql bash
# NOTE: Sets a number of environment variables that can be used to connect
postgresq@123456:/$ psql -h $PG_PORT_5432_TCP_ADDR -p $PG_PORT_5432_TCP_PORT -d docker -U docker --password
```

## Access
```
$ sudo docker ps # check the pgsql port of the container
$ psql -h localhost -p 49153 -d docker -U docker --password
# NOTE: password is docker by default
```

## Test
```
> CREATE TABLE cities (name varchar(80),location point);
> INSERT INTO cities VALUES ('San Francisco', '(-194.0, 53.0)');
> select * from cities;
```

## References
* https://docs.docker.com/engine/examples/postgresql_service/
