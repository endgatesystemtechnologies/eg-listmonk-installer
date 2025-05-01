#!/bin/bash
set -e

echo "🐘 Installing PostgreSQL..."

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql postgresql-contrib

echo "📄 Configuring DB user and schema..."

sudo -u postgres psql <<EOF
CREATE USER listmonk WITH PASSWORD 'listmonk';
CREATE DATABASE listmonk OWNER listmonk;
EOF

echo "✅ PostgreSQL ready"
