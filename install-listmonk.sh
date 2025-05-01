#!/bin/bash
set -e

echo "📥 Downloading Listmonk binary..."

mkdir -p /opt/listmonk
cd /opt/listmonk

# Download v5.0.0 Linux binary
curl -LO https://github.com/knadh/listmonk/releases/download/v5.0.0/listmonk_5.0.0_linux_amd64.tar.gz

echo "📦 Extracting Listmonk..."
tar -xvzf listmonk_5.0.0_linux_amd64.tar.gz
rm listmonk_5.0.0_linux_amd64.tar.gz

echo "⚙️ Injecting config.toml..."
curl -fsSL https://raw.githubusercontent.com/endgatesystemtechnologies/eg-listmonk-installer/main/config/config.toml.template -o config.toml

echo "🛠️ Running Listmonk DB installer..."
./listmonk --config config.toml --install --idempotent

echo "🚀 Starting Listmonk..."
nohup ./listmonk --config config.toml > listmonk.log 2>&1 &

echo "✅ Listmonk running on http://localhost:9000"
