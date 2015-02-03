#!/bin/bash

echo "=================================="
echo "tworzenie pliku"
CID=$( docker run -d ubuntu:14.04 bash -c 'echo "hello world" > /test.txt' )

echo "=================================="
echo "tworzenie obrazu"
docker commit $CID slafs/bdgweb_test_image:latest

echo "=================================="
echo "sprawdzanie, że obraz istnieje"
docker images | grep bdgweb

echo "=================================="
echo "sprawdzanie, że plik istnieje w kontenerze stworzonym z powyższego obrazu"
NCID=$( docker run -d slafs/bdgweb_test_image cat /test.txt )

echo "=================================="
echo "usuwanie kontenerów"
docker rm $CID
docker rm $NCID

echo "=================================="
echo "usuwanie obrazu"
docker rmi slafs/bdgweb_test_image:latest

