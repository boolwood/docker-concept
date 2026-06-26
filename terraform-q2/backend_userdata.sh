#!/bin/bash

dnf update -y
dnf install -y git python3 python3-pip

cd /home/ec2-user

git clone https://github.com/boolwood/docker-concept.git

cd docker-concept/backend

pip3 install -r requirements.txt

nohup python3 app.py > backend.log 2>&1 &