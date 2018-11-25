#!/bin/bash
git clone https://github.com/Artemmkin/reddit.git /opt/reddit
. /usr/local/rvm/scripts/rvm
cd /opt/reddit && bundle install
cp /tmp/start.sh /opt/reddit
cp /tmp/puma.service /etc/systemd/system
usermod appuser -a -G rvm
chown -R appuser:appuser /opt
chmod u+x /opt/reddit/start.sh
systemctl daemon-reload
systemctl enable puma
systemctl start puma
systemctl status puma
exit 0
