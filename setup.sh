#!/bin/bash

echo " Starting DevOps Setup..."

# Update system

sudo apt update -y

# Install Java

sudo apt install openjdk-11-jdk -y

# Install Tomcat

sudo apt install tomcat10 tomcat10-admin -y

# Install MySQL

sudo apt install mysql-server -y
sudo systemctl start mysql

# Create DB and user

sudo mysql -e "CREATE DATABASE devops_db;"
sudo mysql -e "CREATE USER 'devops_user'@'localhost' IDENTIFIED BY 'StrongPassword123';"
sudo mysql -e "GRANT ALL PRIVILEGES ON devops_db.* TO 'devops_user'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Install Memcached

sudo apt install memcached -y
sudo systemctl start memcached

# Install RabbitMQ

sudo apt install rabbitmq-server -y
sudo systemctl start rabbitmq-server
sudo rabbitmq-plugins enable rabbitmq_management

# Create RabbitMQ user

sudo rabbitmqctl add_user devops devops123
sudo rabbitmqctl set_user_tags devops administrator
sudo rabbitmqctl set_permissions -p / devops ".*" ".*" ".*"

# Install Nginx

sudo apt install nginx -y
sudo systemctl start nginx

# Configure Nginx

sudo bash -c 'cat > /etc/nginx/sites-available/default <<EOF
server {
listen 80 default_server;
listen [::]:80 default_server;

```
server_name _;

location / {
    proxy_pass http://localhost:8080;
    proxy_http_version 1.1;
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
}
```

}
EOF'

sudo systemctl restart nginx

echo "Setup Completed Successfully!"
