# Node.js Application Deployment with Supervisor and Nginx

This project provides an Ansible playbook to deploy a Node.js application on a web server using **Supervisor** to manage the Node.js process and **Nginx** as a reverse proxy. The playbook automates the setup of the necessary components, ensuring a smooth deployment of the application.

## Table of Contents

- [Requirements](#requirements)
- [Overview](#overview)
- [Steps to Use](#steps-to-use)
  - [1. Clone the repository](#1-clone-the-repository)
  - [2. Configure Ansible Inventory](#2-configure-ansible-inventory)
  - [3. Customize the Playbook](#3-customize-the-playbook)
  - [4. Run the Ansible Playbook](#4-run-the-ansible-playbook)
  - [5. Access the Application](#5-access-the-application)
- [Configuration Details](#configuration-details)
  - [Supervisor Configuration](#supervisor-configuration)
  - [Nginx Reverse Proxy Configuration](#nginx-reverse-proxy-configuration)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## Requirements

- **Ansible** (for deploying the application)
- **Ubuntu server** (or a compatible Linux distribution)
- **Git** (for cloning the repository)
- **Node.js** (version 16.x)
- **Supervisor** (to manage the Node.js application)
- **Nginx** (to serve as a reverse proxy)

The playbook assumes that you have root access to the server via `sudo` and that SSH access is configured.

## Overview

This deployment process includes:

1. **Updating the apt package list** to ensure that you have the latest available versions of packages.
2. **Installing required dependencies** such as `curl`, `git`, and others.
3. **Installing Node.js** (version 16.x) to run your application.
4. **Installing Supervisor** to manage the Node.js application process.
5. **Cloning the Node.js application** from your GitHub repository.
6. **Installing Node.js dependencies** using `npm install`.
7. **Creating a Supervisor configuration** to keep the Node.js application running and restart it if it crashes.
8. **Installing Nginx** and configuring it as a reverse proxy for your Node.js application.
9. **Starting Supervisor and Nginx services** and ensuring they are enabled on boot.


****************Make sure to udpate public IP in hosts***************
