#!/usr/bin/env bash

cd ecosystem/packer/
packer build -force nodejs_server.json

cd ../ecosystem/terraform/
terraform apply
