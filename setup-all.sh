#!/bin/bash

# setup or update all Docker Stacks

docker stack deploy -c portainer-docker-compose.yml portainer
