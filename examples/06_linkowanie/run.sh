#!/bin/bash

echo 'uruchamiamy kontener redisa'
docker run -d --name redis_kontener redis

echo 'uruchamiamy sprawdzanie połączenia'
docker run -it --rm --link redis_kontener:redis ubuntu:14.04 bash -c 'grep redis /etc/hosts && ping -c 4 redis'

echo 'instalujemy redis-tools i uruchamiamy redis-cli'
docker run -it --link redis_kontener:redis ubuntu:14.04 bash -c 'apt-get -qq update && apt-get install -y redis-tools && redis-cli -h redis'

echo 'szukamy ID kontenera'

CID=$( docker ps -a | head -2 | tail -1 | awk '{print $1}' )

echo 'zapisujemy kontener jako obraz'
docker commit $CID slafs/bdgweb_redis_cli_test

echo 'sprawdzamy'

docker images | grep "slafs/bdgweb_redis_cli_test"

echo 'sprzątamy'
docker stop redis_kontener
docker rm redis_kontener
docker rmi slafs/bdgweb_redis_cli_test
