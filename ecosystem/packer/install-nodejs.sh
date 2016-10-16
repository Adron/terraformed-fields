#!/usr/bin/env bash

# Install the build essentials for any systems specific Node dependencies.
sudo apt-get install -y build-essential

# Install Node 4.6.1.
curl -sL https://deb.nodesource.com/setup_4.6.1 | sudo -E bash -
sudo apt-get install -y nodejs
