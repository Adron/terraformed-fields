#!/usr/bin/env bash

# This is the setup script for putting the application onto the instances.

timestamp() {
  date +"%T"
}

timestamp

echo "Running setup for node @ $1."

# tar -xvf nodejs_application.tar.gz

# forever start app.js
