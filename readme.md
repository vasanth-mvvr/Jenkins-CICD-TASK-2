# ** Task-2 Automate Code Deployment using CI/CD Pipeline (Jenkins)**

Overview
This project demonstrates the automation of deploying a Node.js application using a CI/CD pipeline powered by Jenkins.
The application is deployed on an AWS EC2 instance and runs on port 3000 inside a Docker container.
The pipeline automates building, packaging, containerization, and deployment, ensuring consistent and reliable delivery.

1. EC2 Instance Setup
   An AWS EC2 instance hosts the Node.js application.
   Security group rules allow inbound traffic on:
   Port 22 for SSH access.
   Port 3000 for accessing the application.
   The instance has Node.js and Docker installed to run containerized applications.
2. Dockerfile
   Builds a lightweight and secure container image for the Node.js application.
   Uses a minimal base image (Node:alpine) to reduce storage requirements.
   Installs all necessary dependencies.
   Runs the application with a non-root user for better security.
   The built image is pushed to Docker Hub, which acts as a container registry.
3. Jenkins CI/CD Pipeline
   Automates the build, test, Dockerization, and deployment of the application.
   Triggered automatically when changes are pushed to the repository.
   Pipeline stages include:
   Version: Reads the application version from package.json.
   Install Dependencies: Installs all Node.js dependencies.
   Build: Packages the application into a zip archive.
   Docker Build & Push: Builds the Docker image and pushes it to Docker Hub.
   Deploy: Optionally triggers a deployment job to deploy the application to the EC2 instance.
