#!/bin/bash
set -e
cd ~
git clone https://github.com/Artemmkin/reddit.git
cd reddit
sudo bash -c "source /etc/profile.d/rvm.sh; bundle install"

sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl daemon-reload
sudo systemctl start puma
sudo systemctl enable puma
