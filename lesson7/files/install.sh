#!/bin/bash
#Install ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io > /tmp/install.sh && chmod +x /tmp/install.sh
bash /tmp/install.sh
source /usr/local/rvm/scripts/rvm
rvm requirements
rvm install 2.4.1
rvm use 2.4.1 --default
gem install bundler -V --no-ri --no-rdoc
#Install mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
apt update && apt install -y mongodb-org
systemctl enable mongod
#Install Application Reddit
git clone https://github.com/Artemmkin/reddit.git /opt/reddit
. /usr/local/rvm/scripts/rvm
cd /opt/reddit && bundle install
cp /tmp/start.sh /opt/reddit
cp /tmp/puma.service /etc/systemd/system
useradd puma -s /usr/sbin/nologin
usermod puma -a -G rvm
chown -R puma:puma /opt
chmod u+x /opt/reddit/start.sh
systemctl daemon-reload
systemctl enable puma
exit 0
