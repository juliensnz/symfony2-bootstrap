#!/bin/bash

if [ "$1" == "cache" -o "$1" == "" ]; then
    rm -rf ./app/logs/;
    rm -rf ./app/cache/;

    php ./app/console cache:clear --env=test --no-debug;
    php ./app/console assetic:dump --env=test --no-debug;
    php ./app/console assets:install --env=test --no-debug;

    chmod -R 777 ./app/logs/;
    chmod -R 777 ./app/cache/;
fi

if [ "$1" == "db" -o "$1" == "" ]; then
    php app/console doctrine:database:drop --env=test --force
    php app/console doctrine:database:create --env=test
    php app/console doctrine:schema:create --env=test

    php app/console doctrine:fixtures:load --env=test --no-interaction
fi
