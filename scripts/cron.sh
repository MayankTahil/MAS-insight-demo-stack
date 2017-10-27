#!/bin/bash 

cd /MASaaS

# Tear down the stack
docker-compose -f mas-insight.stack.yaml down 

# Update code from repository and update images
git pull 
docker-compose -f ns-init.yaml pull 
docker-compose -f mas-insight-stack.yaml pull

# Wait for a bit
sleep 5

docker-compose -f ns-init.yaml up -d

sleep 45

# Restart the stack
source ~/.bashrc
docker-compose -f mas-insight-stack.yaml up -d