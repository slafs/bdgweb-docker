#!/bin/bash

echo 'instalujemy fig'
pip install fig

echo 'uruchamiamy nasze kontenery'
fig up -d

echo 'sprawdzamy czy możemy się połączyć z naszą aplikacją'
sleep 2

curl -s http://127.0.0.1:9000/
curl -s http://127.0.0.1:9000/
curl -s http://127.0.0.1:9000/
curl -s http://127.0.0.1:9000/

echo 'sprzątamy'
fig stop
fig rm --force
