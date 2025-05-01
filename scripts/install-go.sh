#!/bin/bash
set -e

echo "📥 Installing Go (required for Listmonk)..."

GO_VERSION=1.20.14
wget https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz

# Set Go paths for current session
export PATH=$PATH:/usr/local/go/bin

# Validate install
go version
