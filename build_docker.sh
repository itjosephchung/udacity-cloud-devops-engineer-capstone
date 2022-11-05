#!/usr/bin/env bash

CONTAINER_NAME="mkdocs"
VERSION=1.000

# Step 1:
# Build image and add a descriptive tag
docker build --tag ${CONTAINER_NAME}:${VERSION} mkdocs