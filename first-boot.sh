#!/usr/bin/env bash
docker run --rm -v `pwd`/:/app dyoshikawa/laravel:pgsql bash -c "composer install && cp -p -f .env.devkit .env && php artisan key:generate"
