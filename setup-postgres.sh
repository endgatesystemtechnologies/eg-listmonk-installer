#!/bin/bash
set -e

echo "📄 Configuring PostgreSQL user and DB..."

sudo -u postgres psql <<EOF
CREATE USER listmonk WITH PASSWORD 'listmonkpass';
CREATE DATABASE listmonk OWNER listmonk;
EOF

echo "✅ PostgreSQL ready"
