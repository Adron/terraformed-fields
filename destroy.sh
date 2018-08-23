#!/usr/bin/env bash

echo "yes" | terraform destroy
rm -rf terraform.tfstate
rm -rf terraform.tfstate.backup
rm -rf .terraform

cd state

echo "yes" | terraform destroy
rm -rf terraform.tfstate
rm -rf terraform.tfstate.backup
rm -rf .terraform
cd ..
