#!/bin/bash
sudo apt update -y
sudo apt install mysql-server memcached rabbitmq-server -y
sudo systemctl enable mysql
sudo systemctl enable memcached
sudo systemctl enable rabbitmq-server
