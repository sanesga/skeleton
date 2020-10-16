#!/bin/bash
cd /var/www
if [-f vendor/bin/server]; then
    rm -Rf var
    php vendor/bin/server watch 0.0.0.0:8000
else
  composer install -n --prefer-dist --no-dev --no-suggest && composer dump-autoload -n --no-dev --optimize
  rm -Rf var
  php vendor/bin/server watch 0.0.0.0:8000
fi