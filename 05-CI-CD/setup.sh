#!/bin/bash

echo "=============================="
echo " Starting CI/CD Setup Script "
echo "=============================="

# Update system
echo "Updating system packages..."
sudo apt update -y

# Install Java 17
echo "Installing Java 17..."
sudo apt install openjdk-17-jdk -y

# Verify Java
echo "Java version:"
java -version

# Install Git
echo "Installing Git..."
sudo apt install git -y

# Verify Git
echo "Git version:"
git --version

# Install Maven
echo "Installing Maven..."
sudo apt install maven -y

# Verify Maven
echo "Maven version:"
mvn -version

echo "=============================="
echo " Setup Completed Successfully "
echo "=============================="
