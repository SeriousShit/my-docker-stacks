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

#waddleApi
docker stack deploy -c waddleApi-docker-compose.yml waddleApi

#waddle static web
docker stack deploy -c waddleStaticWeb-docker-compose.yml waddleStaticWeb

#Traefik
touch acme.json && chmod 600 acme.json
docker stack deploy -c traefik-docker-compose.yml traefik

#openldap
docker stack deploy -c openldap-docker-compose.yml waddleStaticWeb

#wenkan
docker stack deploy -c wenkan-docker-compose.yml wenkan