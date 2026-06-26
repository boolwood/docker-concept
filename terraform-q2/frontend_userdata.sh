#!/bin/bash

dnf update -y
dnf install -y git nodejs

cd /home/ec2-user

git clone https://github.com/boolwood/docker-concept.git

cd docker-concept/frontend

npm install

export BACKEND_URL=http://BACKEND_PRIVATE_IP:5000/api

nohup npm start > frontend.log 2>&1 &
