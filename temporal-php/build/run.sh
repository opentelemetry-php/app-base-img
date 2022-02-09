#!/bin/sh
# run.sh

composer update \
    && /usr/local/bin/wait-for-temporal.sh temporal /usr/local/bin/rr serve -c /var/app/.rr.yaml;