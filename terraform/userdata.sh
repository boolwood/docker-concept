#!/bin/bash
set -e

# Update system
dnf update -y

# Install Git
dnf install -y git

# Install Python
dnf install -y python3 python3-pip

# Install Node.js 20
dnf install -y nodejs

# Clone project
cd /home/ec2-user

git clone https://github.com/boolwood/docker-concept.git

cd docker-concept

# --------------------
# Backend
# --------------------
cd backend

pip3 install -r requirements.txt

nohup python3 app.py > /home/ec2-user/flask.log 2>&1 &

# --------------------
# Frontend
# --------------------
cd ../frontend

npm install

nohup npm start > /home/ec2-user/express.log 2>&1 &