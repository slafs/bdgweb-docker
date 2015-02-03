#!/bin/bash

echo 'budujemy aplikacje'
docker build -t slafs/bdgweb_app_08 app/

echo 'uruchamiamy kontener redisa'
docker run -d --name=redis_kontener redis

echo 'uruchamimy kontener z aplikacją'
docker run -d --name=aplikacja_www --link=redis_kontener:redis_host -p 9000:8080 slafs/bdgweb_app_08

echo 'sprawdzamy (x3) czy nasz licznik się zwiększa'

sleep 2
curl -s http://127.0.0.1:9000/
curl -s http://127.0.0.1:9000/
curl -s http://127.0.0.1:9000/

echo 'sprzątamy (tylko trochę)'
docker stop aplikacja_www
docker rm aplikacja_www
docker stop redis_kontener
docker rm redis_kontener
