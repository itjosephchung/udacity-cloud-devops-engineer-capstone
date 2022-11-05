## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
#Vars
CLUSTER_NAME=devops-capstone
REGION_NAME=us-east-1
KEYPAIR_NAME=key-pair-us-east-1
DEPLOYMENT_NAME=devops-capstone
NEW_IMAGE_NAME=registry.hub.docker.com/gampie/devops-capstone:latest
CONTAINER_PORT=8000
HOST_PORT=8000
KUBECTL=./bin/kubectl

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.devops

install:
	# This should be run from inside a virtualenv
	echo "Installing: dependencies..."
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	# Additional, optional, tests could go here

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for yaml source code linter: https://yamllint.readthedocs.io/
	# This should be run from inside a virtualenv
	yamllint mkdocs.yml

run:
	mkdocs serve

build-docker:
	./build_docker.sh

run-docker: build-docker
	./run_docker.sh

upload-docker: build-docker
	./upload_docker.sh

ci-validate:
	# Required file: .circleci/config.yml
	circleci config validate

k8s-deployment: eks-create-cluster
	# If using minikube, first run: minikube start
	./run_kubernetes.sh

rolling-update:
	${KUBECTL} get deployments -o wide
	${KUBECTL} set image deployments/${DEPLOYMENT_NAME} \
		${DEPLOYMENT_NAME}=${NEW_IMAGE_NAME}
	echo
	${KUBECTL} get deployments -o wide
	${KUBECTL} describe pods | grep -i image
	${KUBECTL} get pods -o wide

rollout-status:
	${KUBECTL} rollout status deployment ${DEPLOYMENT_NAME}
	echo
	${KUBECTL} get deployments -o wide

rollback:
	${KUBECTL} get deployments -o wide
	${KUBECTL} rollout undo deployment ${DEPLOYMENT_NAME}
	${KUBECTL} describe pods | grep -i image
	echo
	${KUBECTL} get pods -o wide
	${KUBECTL} get deployments -o wide

k8s-cleanup-resources:
	./k8s_cleanup.sh

eks-create-cluster:
	./eks_create_cluster.sh

eks-delete-cluster:
	./eksctl delete cluster --name "${CLUSTER_NAME}" \
		--region "${REGION_NAME}"

all: install lint test

