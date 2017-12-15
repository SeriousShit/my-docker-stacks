#!/bin/bash

# setup or update all Docker Stacks

#setup networks
docker network create --driver=overlay loadbalancer-net

#Portainer
docker stack deploy -c portainer-docker-compose.yml portainer
#Mailserver
#docker stack deploy -c mailserver-docker-compose.yml mailserver
