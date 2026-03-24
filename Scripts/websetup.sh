#!/bin/bash

##### This is web setup script #####
 
Package="apache2 -y"
Path="/tmp/webfiles"
Website="https://www.tooplate.com/zip-templates/2098_health.zip"


echo "Updating System"
sudo apt update -y

echo "Installing required packages"
sudo apt install wget unzip $Package

echo "Starting System's"
sudo systemctl start apache2
sudo systemctl enable apache2

echo "Creating temporary directory"
mkdir -p $Path
cd $Path

echo "Downloading website"
wget $Website

echo "Unzipping File"
unzip 2098_health.zip

echo "Copying file to web server directory"
cp -r 2098_health.zip/* /var/www/html/

echo "Website Deployed Successfully"
