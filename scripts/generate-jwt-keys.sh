#!/bin/bash

# Script to generate RSA key pairs for JWT authentication
# Requires OpenSSL to be installed

echo "Generating RSA key pairs for JWT authentication..."

# Create directory for keys if it doesn't exist
mkdir -p jwt-keys

cd jwt-keys

echo "Generating development keys..."
openssl genrsa -out app-dev.key 2048
openssl rsa -in app-dev.key -pubout -out app-dev.pub

echo "Generating QA keys..."
openssl genrsa -out app-qa.key 2048
openssl rsa -in app-qa.key -pubout -out app-qa.pub

echo "Generating production keys..."
openssl genrsa -out app-prod.key 2048
openssl rsa -in app-prod.key -pubout -out app-prod.pub

echo "Key generation complete!"
echo "Keys are stored in the jwt-keys directory."
echo "Copy the appropriate keys to your environment:"
echo "- Development: app-dev.key and app-dev.pub"
echo "- QA: app-qa.key and app-qa.pub"
echo "- Production: app-prod.key and app-prod.pub"

cd ..
