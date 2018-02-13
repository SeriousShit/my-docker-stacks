#!/bin/bash

# setup or update all Docker Stacks

#setup networks
if [ ! "$(docker network ls | grep loadbalancer-net)" ]; then
	docker network create --driver=overlay loadbalancer-net
fi

#Portainer
docker stack deploy -c portainer-docker-compose.yml portainer

#jenkins
docker stack deploy -c jenkins-docker-compose.yml jenkins

#homepage wirh Hugo
docker stack deploy -c hugo-docker-compose.yml homepage

#Traefik
docker stack deploy -c traefik-docker-compose.yml traefik
