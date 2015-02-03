#!/bin/bash

echo 'uruchamiamy kontener redisa'
docker run -d --name redis_kontener redis

echo 'sprwadzamy zawartość pliku Dockerfile'
cat Dockerfile

echo 'budujemy obraz i sprawdzamy ile nam to zajęło'
time docker build --rm -t slafs/bdgweb_redis_cli_test .

echo 'budujemy obraz jeszcze raz, ale teraz powinno to zająć nieco mniej czasu'
time docker build --rm -t slafs/bdgweb_redis_cli_test .

echo 'sprawdzamy czy mamy obraz do dyspozycji'
docker images | grep bdgweb_redis_cli_test

echo 'uruchamiamy komendę z argumentem "--help"'
docker run --rm -it --link redis_kontener:redis slafs/bdgweb_redis_cli_test --help

echo 'uruchamiamy komendę z domyślnymi argumentami'
docker run --rm -it --link redis_kontener:redis slafs/bdgweb_redis_cli_test

echo 'sprzątamy'
docker stop redis_kontener
docker rm redis_kontener
docker rmi slafs/bdgweb_redis_cli_test
