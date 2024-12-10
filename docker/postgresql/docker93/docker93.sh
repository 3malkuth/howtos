#!/usr/bin/env bash
# Reference: https://docs.docker.com/engine/examples/postgresql_service/

# PERSISTENT
docker run -P --name pg_test eg_postgresql # not in background mode
#docker run -d -P --name pg_test eg_postgresql

# NON-PERSISTENT
# NOTE: --rm removes the container and image when container exit successful
#docker run --rm -P --name pg_test eg_postgresql