#!/usr/bin/env bash

# This is the setup script for putting the application onto the instances.
timestamp() {
  date +"%T"
}

timestamp

echo "Running setup for node @ $1."

tar -xvf brood_application.tar.gz

npm install

forever start app.js
