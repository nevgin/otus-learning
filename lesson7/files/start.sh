#!/bin/bash
source /etc/profile.d/rvm.sh
/usr/local/rvm/gems/ruby-2.4.1/bin/puma -d --pidfile /tmp/service.pid
