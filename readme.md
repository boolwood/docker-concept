# Docker & Terraform Deployment Assignment

## Overview

This repository demonstrates the deployment of a Flask backend and an Express frontend using Docker, Terraform, and AWS infrastructure. The assignment is divided into three parts, showcasing different deployment strategies and cloud architectures.

### Technologies Used

* AWS EC2
* AWS ECR
* AWS ECS Fargate
* AWS Application Load Balancer (ALB)
* AWS VPC
* Docker
* Terraform
* Python Flask
* Node.js Express

---

# Project Structure

```text
docker-concept/
│
├── backend/
│   ├── app.py
│   ├── Dockerfile
│   └── requirements.txt
│
├── frontend/
│   ├── index.js
│   ├── Dockerfile
│   └── package.json
│
├── docker-compose.yml
│
├── terraform-q1/
│
├── terraform-q2/
│
└── terraform-q3/
```

---

# Part 1: Deploy Flask and Express on a Single EC2 Instance

## Objective

Deploy both applications on a single EC2 instance using Terraform.

## Architecture

```text
EC2 Instance
│
├── Flask Backend (Port 5000)
│
└── Express Frontend (Port 3000)
```

## Features

* Infrastructure provisioned using Terraform
* Single EC2 instance deployment
* Automated application setup using User Data
* Flask and Express running simultaneously
* Public access through EC2 Public IP

## Components

* EC2 Instance
* Security Group
* User Data Scripts
* Flask Backend
* Express Frontend

---

# Part 2: Deploy Flask and Express on Separate EC2 Instances

## Objective

Deploy backend and frontend on separate EC2 instances.

## Architecture

```text
Frontend EC2
(Port 3000)
      │
      ▼
Backend EC2
(Port 5000)
```

## Features

* Two dedicated EC2 instances
* Isolated frontend and backend environments
* Security groups configured for inter-instance communication
* Terraform-managed networking resources
* Automated deployment using User Data

## Components

### Frontend Instance

* Express Application
* Node.js Runtime

### Backend Instance

* Flask Application
* Python Runtime

### Networking

* VPC
* Subnets
* Security Groups
* Route Tables

---

# Part 3: Deploy Flask and Express Using Docker, ECR, ECS and ALB

## Objective

Containerize both applications and deploy them using AWS managed services.

## Architecture

```text
Internet
    │
    ▼
Application Load Balancer
    │
    ├── /
    │    └── Frontend ECS Service
    │
    └── /api
         └── Backend ECS Service
```

## Features

* Dockerized applications
* Amazon ECR repositories
* ECS Fargate deployment
* Application Load Balancer routing
* VPC and networking resources
* Infrastructure as Code using Terraform
* Remote Terraform State Management using S3

## AWS Resources Created

### Networking

* VPC
* Public Subnets
* Internet Gateway
* Route Tables

### Container Services

* Amazon ECR
* Amazon ECS Cluster
* ECS Task Definitions
* ECS Services

### Load Balancing

* Application Load Balancer
* Target Groups
* Listener Rules

### Security

* IAM Roles
* Security Groups

---

# Docker

## Build Backend

```bash
docker build -t backend ./backend
```

## Build Frontend

```bash
docker build -t frontend ./frontend
```

## Run Using Docker Compose

```bash
docker-compose up --build
```

---

# Terraform Workflow

Initialize Terraform

```bash
terraform init
```

Validate Configuration

```bash
terraform validate
```

Preview Infrastructure Changes

```bash
terraform plan
```

Deploy Infrastructure

```bash
terraform apply
```

Destroy Infrastructure

```bash
terraform destroy
```

---

# Learning Outcomes

* Infrastructure as Code with Terraform
* Docker Containerization
* AWS EC2 Deployment
* AWS ECS Fargate Deployment
* AWS ECR Integration
* AWS Networking Concepts
* Load Balancer Configuration
* Security Group Management
* Cloud Infrastructure Automation

---

# Author

TANVEER

IIIT Pune

DevOps & Cloud Computing Assignment
