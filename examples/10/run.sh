#!/bin/bash

echo 'instalujemy fig'
pip install fig

echo 'uruchamiamy nasze kontenery'
fig up -d

echo 'dołożymy nieco więcej kontenerów aplikacji'
sleep 5
fig scale app=4

echo 'sprawdzamy czy możemy się połączyć z naszą aplikacją (czekamy 5 sek.)'
sleep 5

curl -s http://127.0.0.1:9000/
curl -s http://127.0.0.1:9000/
curl -s http://127.0.0.1:9000/
curl -s http://127.0.0.1:9000/

echo 'sprzątamy'
fig stop
fig rm --force
