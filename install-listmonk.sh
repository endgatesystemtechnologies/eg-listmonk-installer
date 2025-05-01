#!/bin/bash
set -e

echo "📥 Downloading Listmonk binary"

cd /opt
wget https://github.com/knadh/listmonk/releases/download/v2.5.0/listmonk-linux-amd64.tar.gz
tar -xzf listmonk-linux-amd64.tar.gz
cd listmonk-linux-amd64

echo "⚙️ Injecting config.toml"

curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/eg-listmonk-installer/main/config/config.toml.template -o config.toml

echo "🧱 Running Listmonk setup"
./listmonk --install --yes

echo "🚀 Starting Listmonk"
nohup ./listmonk > listmonk.log 2>&1 &

echo "✅ Listmonk is live on port 9000"
