#!/bin/bash
set -e

echo "📥 Downloading Listmonk binary..."

cd /opt
wget https://github.com/knadh/listmonk/releases/download/v5.0.0/listmonk-linux-amd64.tar.gz
tar -xzf listmonk-linux-amd64.tar.gz
cd listmonk-linux-amd64

echo "⚙️ Injecting config.toml..."
curl -fsSL https://raw.githubusercontent.com/endgatesystemtechnologies/eg-listmonk-installer/main/config/config.toml.template -o config.toml

echo "🛠️ Running Listmonk DB installer..."
./listmonk --install --yes

echo "🚀 Launching Listmonk..."
nohup ./listmonk > listmonk.log 2>&1 &
