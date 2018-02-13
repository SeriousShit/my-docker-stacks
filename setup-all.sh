#!/bin/bash

# setup or update all Docker Stacks

#setup networks
docker network create --driver=overlay loadbalancer-net


#Portainer
docker stack deploy -c portainer-docker-compose.yml portainer

#jenkins
docker stack deploy -c jenkins-docker-compose.yml jenkins

#homepage wirh Hugo
docker stack deploy -c hugo-docker-compose.yml homepage

#Traefik
docker stack deploy -c traefik-docker-compose.yml traefik
