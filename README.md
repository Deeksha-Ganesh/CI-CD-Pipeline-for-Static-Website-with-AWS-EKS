# CI/CD Pipeline for Static Website on AWS EKS

## Overview

This project demonstrates a full CI/CD pipeline for deploying a static website to Kubernetes on AWS EKS using Jenkins, Docker, and Kubernetes manifests.

## The pipeline automates:

Building a Docker image.

Pushing it to Docker Hub.

Deploying it to an EKS cluster.

Exposing the website via a LoadBalancer.

## Tools Used

Jenkins – Automation server for CI/CD.

Docker – Containerizing the static website.

Kubernetes (EKS) – Orchestrating containers on AWS.

AWS CLI & eksctl – Managing EKS cluster and resources.

GitHub – Source code repository.

## Project Workflow
1. Prepare Environment

    Launch an EC2 instance.

    Create an IAM user with required policies and configure AWS CLI.

    Install Jenkins, Docker, kubectl, and eksctl on the instance.

2. Set Up EKS

    Create EKS cluster using eksctl.

    Associate the cluster with OIDC provider.

    Create a node group.

    Update kubeconfig for Kubernetes access.

3. Prepare Application

    Write Dockerfile for the static website.

    Create deployment.yaml and service.yaml for Kubernetes.

    Push the application code to GitHub.

4. Configure Jenkins

    Create a Jenkins user for access.

    Add Docker Hub credentials in Jenkins.

    Write a Jenkinsfile for CI/CD pipeline.

    Create a pipeline job in Jenkins.

5. Run Pipeline

    Trigger the Jenkins job to:

    Clone the GitHub repository.

    Build Docker image.

    Push image to Docker Hub.

    Deploy to EKS.

6. Access the Website

    Use the LoadBalancer URL provided by the Kubernetes service to access the website.
<img width="1891" height="956" alt="image" src="https://github.com/user-attachments/assets/21acdc45-29e3-4609-b9ef-641760e35150" />
