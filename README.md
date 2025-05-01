EG Listmonk Installer
Self-hosted, SSH-free Listmonk deployment script.

Usage
Run this in your VPS console:

curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/eg-listmonk-installer/main/install.sh | bash

Stack
Ubuntu 22.04
Go 1.20+
PostgreSQL
Listmonk (binary)
SES-compatible SMTP

Customization
Before running the installer, you may edit config/config.toml.template with:

Your desired SMTP credentials (SES, MXRoute, etc.)

Admin login (admin_username, admin_password)

site_url domain (used for UI access)

Sender name and email (from_email, from_name)

This ensures the deploy is preloaded with your live settings.

