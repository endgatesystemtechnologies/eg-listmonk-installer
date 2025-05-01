#!/bin/bash
set -e

echo "📥 Downloading Listmonk binary"

cd /opt
curl -LO https://github.com/knadh/listmonk/releases/download/v2.5.0/listmonk_2.5.0_linux_amd64.tar.gz
tar -xzf listmonk_2.5.0_linux_amd64.tar.gz
rm listmonk_2.5.0_linux_amd64.tar.gz

echo "⚙️ Injecting config.toml"

curl -fsSL https://raw.githubusercontent.com/endgatesystemtechnologies/eg-listmonk-installer/main/config/config.toml.template -o /opt/listmonk/config.toml

echo "🧱 Running DB migrations"
/opt/listmonk/listmonk --install --config /opt/listmonk/config.toml

echo "🚀 Launching Listmonk"
/opt/listmonk/listmonk --config /opt/listmonk/config.toml &
