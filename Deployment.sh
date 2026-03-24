#!/bin/bash


echo "Updating system..."
sudo apt update -y

echo "Installing Apache..."
sudo apt install apache2 -y

echo "Moving to /tmp directory..."
cd /tmp

echo "Downloading website template..."
wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip

echo "Installing unzip..."
sudo apt install unzip -y

echo "Extracting files..."
unzip 2137_barista_cafe.zip

echo "Copying files to web directory..."
sudo cp -r 2137_barista_cafe/* /var/www/html/

echo "Restarting Apache..."
sudo systemctl restart apache2

echo "Deployment completed! Open your browser."
