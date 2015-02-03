#!/bin/bash

docker run -it ubuntu:14.04 bash

LAST_CONTAINER_ID=$( docker ps -a | head -2 | tail -1 | cut -d" " -f1 )

docker diff $LAST_CONTAINER_ID
