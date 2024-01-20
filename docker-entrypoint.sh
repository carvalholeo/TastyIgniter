#!/bin/bash
set -e

if [ ! -e '/var/www/html/index.php' ]; then
	tar cf - --one-file-system -C /usr/src/tastyigniter . | tar xf -
        php artisan key:generate --force
	php artisan igniter:install --no-interaction

fi
        chown -R www-data:www-data /var/www/html

exec "$@"
