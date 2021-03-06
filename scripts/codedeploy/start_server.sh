#!/usr/bin/env bash
cd /srv/app
../../node_modules/.bin/webpack
/srv/app/node_modules/.bin/webpack -p

rm -f ../shared/node_env
echo "dev" >> ../shared/node_env

sudo CONFIG_PATH='/home/ubuntu/config.json' NODE_ENV=`cat ../shared/node_env` ~/.npm-packages/bin/forever start -a -l /srv/app/logs/forever.log -o /srv/app/logs/out.log -e /srv/app/logs/err.log --uid "drone-server" --pidFile /srv/shared/pids/drone-server.pid /srv/app/server.js
