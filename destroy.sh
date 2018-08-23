#!/usr/bin/env bash

echo "yes" | terraform destroy
rm -rf terraform.tfstate
rm -rf terraform.tfstate.backup
rm -rf .terraform

cd state

gsutil rm -r gs://all-the-things-storage
rm -rf terraform.tfstate
rm -rf terraform.tfstate.backup
rm -rf .terraform
cd ..
