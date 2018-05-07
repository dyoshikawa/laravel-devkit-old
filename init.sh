#!/usr/bin/env bash

echo "Initialized start"

if [ ! -f composer.json ]; then
    echo "delete files"

    path=`ls -a`;
    declare -a exists=();
    exists=${path//\// };

    for e in ${exists[@]};
    do
        case $e in
            ".")
                echo "skip .";;
            "..")
                echo "skip ..";;
            "init.sh")
                echo "skip init.sh";;
            "docker-compose.yml")
                echo "skip docker-compose.yml";;
            ".idea")
                echo "skip .idea";;
            *)
                rm -rf $e
                echo "delete" $e
        esac
    done

    echo "generate laravel files"

    docker run -d --name dyoshikawa-laravel dyoshikawa/laravel
    docker cp dyoshikawa-laravel:/app ./laravel-app
    mv laravel-app/* .
    mv laravel-app/.??* .
    rmdir laravel-app
    rm .env
fi

docker run --rm -v `pwd`/:/app dyoshikawa/laravel:latest bash -c \
    "composer install && cp -p -f .env.devkit .env && php artisan key:generate"

echo "Initialized successfully!"

exit 0
