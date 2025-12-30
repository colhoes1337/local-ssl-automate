#!/bin/bash

# Local SSL Auto-Trust Script for macOS
# This script automates trusting SSL certificates and updating URLs to HTTPS

set -e

echo "🔒 Local SSL Auto-Trust Script"
echo "================================"
echo ""

# Get the site domain from Local environment or wp-cli
SITE_DOMAIN=""

# Try to get from wp-cli first (most reliable)
if command -v wp &> /dev/null; then
    SITE_DOMAIN=$(wp option get siteurl 2>/dev/null | grep -oE '[^/]+\.local' || echo "")
fi

# If still empty, ask the user
if [ -z "$SITE_DOMAIN" ]; then
    echo "Enter your Local site domain (e.g., mysite.local):"
    read -r SITE_DOMAIN
    
    if [ -z "$SITE_DOMAIN" ]; then
        echo "❌ Error: No domain provided"
        exit 1
    fi
fi

SITE_URL="https://${SITE_DOMAIN}"
CERT_PATH="$HOME/Library/Application Support/Local/run/router/nginx/certs/${SITE_DOMAIN}.crt"

echo "📍 Site: $SITE_DOMAIN"
echo ""

# Step 1: Check if certificate exists
echo "Step 1/3: Checking certificate..."
if [ ! -f "$CERT_PATH" ]; then
    echo "❌ Certificate not found at: $CERT_PATH"
    echo "   Please click 'Trust' button in Local first"
    exit 1
fi
echo "✅ Certificate found"
echo ""

# Step 2: Trust the certificate
echo "Step 2/3: Trusting certificate..."
echo "   (You may be asked for your password)"

# Add certificate to keychain and trust it
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain "$CERT_PATH" 2>/dev/null || true

echo "✅ Certificate trusted"
echo ""

# Step 3: Update database URLs
echo "Step 3/3: Updating database URLs to HTTPS..."

# Check if site is using HTTP
CURRENT_URL=$(wp option get siteurl 2>/dev/null || echo "")

if [[ $CURRENT_URL == http://* ]]; then
    # Replace HTTP with HTTPS
    wp search-replace "http://${SITE_DOMAIN}" "https://${SITE_DOMAIN}" --all-tables --quiet
    echo "✅ Database URLs updated to HTTPS"
else
    echo "ℹ️  URLs already using HTTPS"
fi

echo ""
echo "🎉 Done! Your site should now work with HTTPS"
echo ""
echo "   Open your site: $SITE_URL"
echo "   Look for the 🔒 lock icon in your browser"
echo ""