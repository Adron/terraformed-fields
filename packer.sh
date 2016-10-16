#!/usr/bin/env bash

# This file builds all of the related servers for this application.
cd ecosystem/packer/
packer build nodejs_server.json