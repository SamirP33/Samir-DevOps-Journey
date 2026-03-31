#!/bin/bash

sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2

echo "Hello from $(hostname)" > /var/www/html/index.html
