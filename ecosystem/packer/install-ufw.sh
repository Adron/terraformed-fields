#!/usr/bin/env bash
sudo apt-get install -y ufw
sudo ufw allow 22/tcp
sudo ufw allow 3000/tcp
echo "y" | sudo ufw enable
