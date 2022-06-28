#!/bin/sh
# run.sh

composer install && /usr/local/bin/rr serve -c /var/app/.rr.yaml;
