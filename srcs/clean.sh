#!/bin/bash

docker compose down -v
docker image rm -f $(docker image ls -aq)

rm -rf /home/eel-ansa/data/wordpress/*
rm -rf /home/eel-ansa/data/mariadb/*

#green text
echo -e "\e[32mCleanup completed successfully.\e[0m"

echo "docker ps -a"
docker ps -a

echo "docker images"
docker images

echo "data/wordpress contents:"
ls -la /home/eel-ansa/data/wordpress/
echo "data/mariadb contents:"
ls -la /home/eel-ansa/data/mariadb/

