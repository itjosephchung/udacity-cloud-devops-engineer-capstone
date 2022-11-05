[![CircleCI](https://dl.circleci.com/status-badge/img/gh/itjosephchung/udacity-cloud-devops-engineer-capstone/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/itjosephchung/udacity-cloud-devops-engineer-capstone/tree/main)

## Capstone Project - Cloud DevOps
In this project, we will prove all the skills we have learned from this Cloud DevOps Engineer Udacity course.

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv.
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host.
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=`which python3` .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Installation
To install MkDocs, run the following command from the command line:

```bash 
pip install mkdocs
```

### Running `mkdocs`

1. Standalone:  `mkdocs serve`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### files in the repository
* `.circleci` directory contain the .circleci `config.yml` file
* `app.py` is the python file dfining the application
* `Dockerfile` is the Dockerfile
* `requirement.txt` contains the python requirement for the `app.py`
* `mkdocs_cluster.yml` EKS cluster definition file

* `Makefile` The Makefile includes instructions on environment setup and lint test* 
* `run_docker.sh` contains the script to build and run docker locally
* `run_kubernetes.sh` contains to orchestrate kubernetes from the docker image
* `upload_docker.sh` contains the script to upload the docker image to dockerhub
* `make_predictions.sh` for making predictions 
* `eks_create_cluster.sh`: creates the EKS cluster
* `install_eksctl.sh`: installs the eksctl tool
* `install_kubectl.sh`: installs the kubectl tool to control K8S clusters
* `k8s_cleanup.sh`: deletes services and deployments in a K8S cluster

## Built With
CircleCI - Cloud-based CI/CD service
Amazon AWS - Cloud services
AWS CLI - Command-line tool for AWS
CloudFormation - Infrastructure as Code
Ansible - Configuration management tool
Mkdocs - Open source for static site generator
Kubernetes - Cluster container service
Deployment - Blue/green deployment

## Screenshot of CircleCI CI/CD
![CI/CD Pipeline](circleci.png)
