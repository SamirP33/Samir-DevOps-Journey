#!/bin/bash
set -e

INSTANCE_ID="i-02b6ec1e0d5eb791f"

Start_instance() {
    echo "Starting EC2 Instance"
    aws ec2 start-instances --instance-ids $INSTANCE_ID
    echo "EC2 Instance has been started"
}

Stop_instance() {
    echo "Stopping EC2 Instance"
    aws ec2 stop-instances --instance-ids $INSTANCE_ID
    echo "EC2 Instance has been stopped"
}

if [[ $1 == "start" ]]; then
    Start_instance

elif [[ $1 == "stop" ]]; then
    Stop_instance

else
    echo "Usage: $0 {start|stop}"
fi

