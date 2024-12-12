# AWS Infrastructure Setup with Terraform

This project sets up a basic AWS infrastructure using Terraform. It creates the following resources:

- A **VPC** (Virtual Private Cloud) with DNS support and hostnames enabled.
- A **subnet** in a specific availability zone.
- A **security group** allowing SSH (port 22) and HTTP (port 80) access.
- An **Internet Gateway** to enable internet access for resources.
- A **route table** and its association with the subnet for routing internet traffic.
- An **EC2 instance** with **Nginx** installed and running.
- A **key pair** for SSH access to the EC2 instance.

## Requirements

- **Terraform** (for provisioning the infrastructure)
- **AWS account** (with necessary permissions)
- **AWS CLI configured** (for accessing your AWS account)
- **SSH client** (for connecting to the EC2 instance)

## Overview

This Terraform configuration will provision the following resources in AWS:

1. **VPC** with a specified CIDR block.
2. **Subnet** within the VPC.
3. **Security Group** allowing inbound traffic on port 22 (SSH) and port 80 (HTTP).
4. **Internet Gateway** for internet access.
5. **Route Table** that enables traffic routing.
6. **EC2 Instance** in the subnet, running **Nginx** as a web server.
7. **Key Pair** for secure SSH access to the EC2 instance.

The EC2 instance will be configured to install and start **Nginx** using a simple **user-data script** during the instance initialization.
