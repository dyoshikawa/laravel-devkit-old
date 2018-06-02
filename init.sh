#!/usr/bin/env bash
docker run --rm -v `pwd`:/myproject dyoshikawa/laravel composer update
cp -p .env.devkit .env
docker run --rm -v `pwd`:/myproject dyoshikawa/laravel php artisan key:generate
