#!/bin/bash
set -e
source ~/.profile
cd ~
git clone https://github.com/Artemmkin/reddit.git
cd reddit
bundle install

sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl daemon-reload
sudo systemctl start puma
sudo systemctl enable puma
