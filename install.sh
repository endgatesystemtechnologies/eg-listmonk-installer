#!/bin/bash
set -e

echo "🚀 Starting DF Listmonk Installer"

# Install Go
curl -fsSL https://raw.githubusercontent.com/endgatesystemtechnologies/eg-listmonk-installer/main/scripts/install-go.sh | bash

# Setup PostgreSQL
curl -fsSL https://raw.githubusercontent.com/endgatesystemtechnologies/eg-listmonk-installer/main/scripts/setup-postgres.sh | bash

# Install Listmonk
curl -fsSL https://raw.githubusercontent.com/endgatesystemtechnologies/eg-listmonk-installer/main/scripts/install-listmonk.sh | bash

echo "✅ All steps completed. Listmonk should now be running."
