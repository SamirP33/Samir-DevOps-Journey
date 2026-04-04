#!/bin/bash
sudo apt update -y
sudo apt install openjdk-11-jdk -y
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz
tar -xvzf apache-tomcat-9.0.75.tar.gz
