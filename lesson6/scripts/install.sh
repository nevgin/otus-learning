#!/bin/bash
apt install git
git clone https://github.com/nevgin/lesson6.git /lesson6
cd /lesson6
. install_ruby.sh
cd /lesson6
. install_mongodb.sh
cd /lesson6
. install_app.sh

