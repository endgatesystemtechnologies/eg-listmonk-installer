#!/bin/bash
set -e

echo "📥 Downloading Listmonk v5.0.0 binary..."

mkdir -p /opt/listmonk
cd /opt/listmonk

curl -LO https://github.com/knadh/listmonk/releases/download/v5.0.0/listmonk_5.0.0_linux_amd64.tar.gz
tar -xzf listmonk_5.0.0_linux_amd64.tar.gz

echo "⚙️ Injecting config.toml..."

curl -fsSL https://raw.githubusercontent.com/endgatesystemtechnologies/eg-listmonk-installer/main/config/config.toml.template -o config.toml

echo "🧱 Running DB migrations..."

./listmonk --install --yes --config config.toml

echo "🚀 Starting Listmonk..."

nohup ./listmonk --config config.toml > /dev/null 2>&1 &

echo "✅ Listmonk is live on http://<your-ip>:9000"
