[![CircleCI](https://dl.circleci.com/status-badge/img/gh/itjosephchung/udacity-cloud-devops-engineer-capstone/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/itjosephchung/udacity-cloud-devops-engineer-capstone/tree/main)

## Capstone Project - Cloud DevOps
In this project, we will prove all the skills we have learned from this Cloud DevOps Engineer Udacity course.

## Application
The Application is based on a python3 script using flask to render a simple webpage in the user's browser. A requirements.txt is used to ensure that all needed dependencies come along with the Application.

## Kubernetes Cluster
I used AWS CloudFormation to deploy the Kubernetes Cluster. The CloudFormation Deployment can be broken down into four Parts:

* Networking, to ensure new nodes can communicate with the Cluster
* Elastic Kubernetes Service (EKS) is used to create a Kubernetes Cluster
* NodeGroup, each NodeGroup has a set of rules to define how instances are operated and created for the EKS-Cluster
* Management is needed to configure and manage the Cluster and its deployments and services. I created two management hosts for extra redundancy if one of them fails.

## Linting using Pylint and Hadolint
Linting is used to check if the Application and Dockerfile is syntactically correct. This process makes sure that the code quality is always as good as possible.

## Public LB DNS
http://a382f7464ca584decb4388fcef02e0f2-242170676.us-east-1.elb.amazonaws.com

![img](https://github.com/itjosephchung/udacity-cloud-devops-engineer-capstone/blob/bf1d5b6e54564a2758e5edbaa87000ccef9d64c8/screenshots/ELB%20access%20result.png)
