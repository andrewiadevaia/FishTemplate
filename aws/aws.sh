#!/bin/bash

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
