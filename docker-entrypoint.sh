#!/bin/sh
set -e

: "${PORT:=80}"

# Update Apache listening port
if [ -f /etc/apache2/ports.conf ]; then
    sed -ri "s/^(Listen ).*/\1${PORT}/" /etc/apache2/ports.conf
fi

# Update default virtual host to listen on $PORT
if [ -f /etc/apache2/sites-enabled/000-default.conf ]; then
    sed -ri "s/<VirtualHost \*:[0-9]+>/<VirtualHost *:${PORT}>/" /etc/apache2/sites-enabled/000-default.conf
fi

exec "$@"