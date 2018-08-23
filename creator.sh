#!/usr/bin/env bash

BUCKET_NAME="all-the-things-storage"

# Configure the state management of Terraform to use Google Cloud Storage.

cd state
terraform init
echo "yes" | terraform apply

cd ..

echo "yes" | terraform init
echo "yes" | terraform apply