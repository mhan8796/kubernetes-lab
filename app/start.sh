#!/bin/sh
set -eu

sed "s/{{POD_NAME}}/${HOSTNAME}/g" /www/index.template.html > /www/index.html

while true; do
  echo "hello world from ${HOSTNAME} at $(date)"
  sleep 5
done &

exec httpd -f -p 8080 -h /www
