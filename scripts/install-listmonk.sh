#!/bin/bash
set -e

echo "📥 Downloading Listmonk v5.0.0 binary..."

mkdir -p /opt/listmonk
cd /opt/listmonk

curl -LO https://github.com/endgatesystemtechnologies/ph-official/releases/download/v5.0.2/listmonk_5.0.2_linux_amd64.tar.gz


echo "⚙️ Injecting config.toml..."

curl -fsSL https://raw.githubusercontent.com/endgatesystemtechnologies/eg-listmonk-installer/main/config/config.toml.template -o config.toml

echo "🧱 Running DB migrations..."

./listmonk --install --yes --config config.toml

echo "🚀 Starting Listmonk..."

nohup ./listmonk --config config.toml > /dev/null 2>&1 &

echo "✅ Listmonk is live on http://<your-ip>:9000"
