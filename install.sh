#!/bin/bash
set -e

echo "🚀 Starting DF Listmonk Installer"

# Install Go
curl -fsSL https://raw.githubusercontent.com/endgatesystemtechnologies/eg-listmonk-installer/main/setup-node.sh | bash

# Set up PostgreSQL
curl -fsSL https://raw.githubusercontent.com/endgatesystemtechnologies/eg-listmonk-installer/main/setup-postgres.sh | bash

# Install Listmonk
curl -fsSL https://raw.githubusercontent.com/endgatesystemtechnologies/eg-listmonk-installer/main/install-listmonk.sh | bash

echo "✅ All steps completed. Listmonk should now be running."
