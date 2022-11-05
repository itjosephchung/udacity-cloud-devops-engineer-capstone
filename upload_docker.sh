#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=itjosephchung/mkdocs

# Step 2:
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

docker login -u itjosephchung
docker tag mkdocs $dockerpath:latest

# Step 3:
# Push image to a docker repository
docker push $dockerpath:latest
