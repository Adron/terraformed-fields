#!/usr/bin/env bash

# This is for some of the npm install dependencies, which will need to build.
sudo apt-get install -y build-essential

nvm install 4.6.1
nvm use 4.6.1
nvm alias default 4.6.1
