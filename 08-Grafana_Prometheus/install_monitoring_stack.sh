#!/bin/bash

set -e

echo "=============================="
echo " DevOps Monitoring Stack Setup"
echo "=============================="

# -----------------------------
# 1. Update system
# -----------------------------
echo "Updating system..."
sudo apt update -y

# -----------------------------
# 2. Install dependencies
# -----------------------------
echo "Installing required tools..."
sudo apt install wget curl tar -y

# -----------------------------
# 3. Install Node Exporter (FIXED)
# -----------------------------
echo "Installing Node Exporter..."

NODE_VERSION="1.11.1"

cd ~
wget https://github.com/prometheus/node_exporter/releases/download/v${NODE_VERSION}/node_exporter-${NODE_VERSION}.linux-amd64.tar.gz

tar -xvf node_exporter-${NODE_VERSION}.linux-amd64.tar.gz
cd node_exporter-${NODE_VERSION}.linux-amd64

nohup ./node_exporter > node_exporter.log 2>&1 &

echo "Node Exporter started on port 9100"

# -----------------------------
# 4. Start Prometheus
# -----------------------------
echo "Starting Prometheus..."

cd ~/prometheus-3.13.0.linux-amd64

nohup ./prometheus --config.file=prometheus.yml > prometheus.log 2>&1 &

echo "Prometheus started on port 9090"

# -----------------------------
# 5. Grafana (if installed via apt)
# -----------------------------
echo "Starting Grafana service..."

sudo systemctl enable grafana-server || true
sudo systemctl start grafana-server || true

echo "Grafana running on port 3000"

# -----------------------------
# Done
# -----------------------------
echo "=============================="
echo " All services started successfully"
echo "=============================="

echo "Prometheus: http://localhost:9090"
echo "Node Exporter: http://localhost:9100/metrics"
echo "Grafana: http://localhost:3000"
