#!/bin/bash
## This script is for installing Jenkins on an Ubuntu server.

##1 -system package update
sudo apt-get update

##2 -Java 11 (support ends Sep. 2024)
sudo apt-get install -y openjdk-11-jdk

##3 -Jenkins key | add to system
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

##4 -add Jenkins to sys package source list
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null'

##5 -package list needs update to include Jenkins then install Jenkins
sudo apt-get update
sudo apt-get install -y jenkins

##6 -verify Jenkins is installed and working
sudo systemctl status jenkins


