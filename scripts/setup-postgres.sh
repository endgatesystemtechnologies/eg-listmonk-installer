#!/bin/bash
set -e

echo "🐘 Installing PostgreSQL..."

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql postgresql-contrib

echo "📄 Configuring DB user and schema..."

systemctl enable postgresql
systemctl start postgresql

sudo -u postgres psql <<EOF
CREATE USER IF NOT EXISTS listmonk WITH PASSWORD 'listmonk';
CREATE DATABASE IF NOT EXISTS listmonk OWNER listmonk;
EOF

echo "✅ PostgreSQL ready"
