#!/bin/bash

docker run -it -v $PWD/przyklad:/mojwolumen ubuntu:14.04 bash

cat ./przyklad/hello.txt

