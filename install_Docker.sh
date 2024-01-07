#!/bin/bash
## This script is for updating the Linux os, installing necessary packages for Docker, and giving sudo access for Docker commands.


##1 -system package update
sudo apt-get update

##2 -necessary packages for HTTPS repositories
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

##3 -Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

##4 -adds Docker repository to sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

##5 -package list needs update for new additions to be recognized
sudo apt-get update

##6 -Docker CE package
sudo apt-get install docker-ce -y

##7 -add the current user to docker group; Docker commands without sudo
sudo usermod -aG docker ${USER}

##8 -activate changes to groups
su - ${USER}

##9 -verify Docker installation
sudo systemctl status docker



