# Nginx Deployment with Health Checks and Resource Limits

This project defines a Kubernetes Deployment for Nginx, which runs 3 replicas of an Nginx container with configured health checks (liveness and readiness probes). The deployment also includes resource requests and limits for memory and CPU.

## Requirements

- **Kubernetes Cluster** (local or cloud-based)
- **kubectl** (Kubernetes command-line tool) for interacting with the cluster

## Overview

This Kubernetes deployment manages an Nginx web server with the following configurations:

- **3 replicas** for high availability.
- **Liveness Probe**: Ensures the container is healthy and restarts it if it becomes unresponsive.
- **Readiness Probe**: Ensures that the container is fully ready to serve traffic before it starts receiving requests.
- **Resource Requests and Limits**: Defines CPU and memory limits and requests for efficient resource management in the cluster.

## Steps to Use

### 1. Apply the Deployment

To deploy the Nginx application in your Kubernetes cluster, use the following `kubectl` command:

```bash
kubectl apply -f nginx-deployment.yaml
