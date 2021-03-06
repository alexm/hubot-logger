#!/bin/sh

set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update

# hubot
apt-get install -y npm git
ln -snf /usr/bin/nodejs /usr/local/bin/node
npm install -g coffee-script yo generator-hubot

# ircd
apt-get install -y ircd-hybrid
perl -i -pe 's,^(\s*flags\s*=\s*need_ident),#$1,' /etc/ircd-hybrid/ircd.conf
service ircd-hybrid restart
