#!/bin/bash

set -e

APP_NAME="notes-app"
REPO_URL="https://github.com/LondheShubham153/django-notes-app.git"
PROJECT_DIR="django-notes-app"

echo "****** Deployment Started ******"

Clone_app () {
    if [ -d "$PROJECT_DIR" ]; then
        echo "Directory exists. Pulling latest code..."
        cd $PROJECT_DIR
        git pull
    else
        echo "Cloning repository..."
        git clone $REPO_URL
        cd $PROJECT_DIR
    fi
}

install_requirements(){
    echo "Installing required applications"
    sudo apt-get update
    sudo apt-get install docker.io nginx git -y
}

restart_system() {
    echo "Starting and enabling services"
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo systemctl enable nginx
    sudo systemctl start nginx
}

Deploy_Code() {

    echo "Stopping old container if exists..."
    sudo docker stop $APP_NAME || true
    sudo docker rm $APP_NAME || true

    echo "Building Docker image..."
    sudo docker build -t $APP_NAME .

    echo "Running new container..."
    sudo docker run -d --name $APP_NAME -p 8000:8000 $APP_NAME
}

Clone_app
install_requirements
restart_system
Deploy_Code

echo "****** Deployment Completed ******"
