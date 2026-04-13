#!/bin/bash

echo "Updating system..."
sudo apt update -y

echo "Installing Java 17..."
sudo apt install openjdk-17-jdk -y

echo "Setting JAVA_HOME..."
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

echo "Installing Maven..."
sudo apt install maven -y

echo "Installing Git..."
sudo apt install git -y

echo "Installing Docker..."
sudo apt install docker.io -y

echo "Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Adding current user to Docker group..."
sudo usermod -aG docker $USER

echo "Installing Jenkins..."
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "Setup completed successfully!"
