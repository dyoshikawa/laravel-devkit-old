#!/usr/bin/env bash
docker run --rm -v `pwd`:/myproject dyoshikawa/laravel composer install
cp -p .env.devkit .env
docker run --rm -v `pwd`:/myproject dyoshikawa/laravel php artisan key:generate
docker run --rm -v `pwd`:/myproject dyoshikawa/laravel php artisan ide-helper:generate
docker run --rm -v `pwd`:/myproject dyoshikawa/laravel php artisan ide-helper:meta
