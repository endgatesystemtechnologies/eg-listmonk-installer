#!/bin/bash
set -e

echo "📦 Installing PostgreSQL..."

apt update
apt install -y postgresql postgresql-contrib

echo "📄 Configuring DB user and schema"

sudo -u postgres psql <<EOF
CREATE USER listmonk WITH PASSWORD 'listmonk';
CREATE DATABASE listmonk OWNER listmonk;
EOF

echo "✅ PostgreSQL ready"
