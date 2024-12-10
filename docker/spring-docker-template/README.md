## Build
```
$ mvn package && java -jar target/springDockerTemplate-0.1.0.jar
```
* Build tagged docker image
 * Push as well to remote repo
```
$ mvn package docker:build
# NOTE:
# package needs to be run before docker:build
$ mvn package docker:build -DpushImage
# NOTE:
# Only push if setup credentials properly
# for docker hub
```

## Run 
```
$ sudo docker run -p 8080:8080 -t tripattern/spring-docker-template
``` 

## Notes
* Do not use camel case for the jar name!!

## References
* https://spring.io/guides/gs/spring-boot-docker/