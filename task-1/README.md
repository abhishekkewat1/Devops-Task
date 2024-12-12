# Node.js Application Docker Setup

This project provides a Docker setup for a Node.js application. It uses the official Node.js 16 Alpine image to create a Docker container, installs the necessary dependencies, and runs the Node.js application.

## Requirements

- **Docker** (for building and running the container)
- **Node.js** (for the application)
- **npm** (for installing dependencies)

## Overview

This setup defines a `Dockerfile` to containerize a Node.js application. The Docker image is based on the official `node:16-alpine` image, which is a minimal version of Node.js for efficient builds.

The Docker container will:

1. Set the working directory to `/app`.
2. Copy the `package.json` and `package-lock.json` files and install the application dependencies using `npm install`.
3. Copy the rest of the application files into the container.
4. Expose port `3000`, which the Node.js app will listen on.
5. Run the `app.js` file as the entry point.

## Steps to Use

### 1. Build the Docker image

To build the Docker image, run the following command in the root of your project directory (where the `Dockerfile` is located):

```bash
docker build -t node-app .
