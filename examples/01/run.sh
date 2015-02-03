#!/bin/bash

echo "----------------------------------"
echo "version"
docker version

echo "----------------------------------"
echo "info"
docker info

echo "----------------------------------"
echo "pull"
docker pull ubuntu:14.04

echo "----------------------------------"
echo "images"
docker images | grep ubuntu

echo "----------------------------------"
echo "run"
docker run -d --name mojkontener ubuntu:14.04 sleep 20

echo "----------------------------------"
echo "ps"
docker ps | grep mojkontener

