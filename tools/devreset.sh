#!/bin/bash

rm -rf ./app/logs/;
rm -rf ./app/cache/;

php ./app/console cache:clear --env=dev;
php ./app/console assetic:dump --env=dev;
php ./app/console assets:install --env=dev;
chmod -R 777 ./app/logs/;
chmod -R 777 ./app/cache/;

php app/console doctrine:database:drop --env=dev --force
php app/console doctrine:database:create --env=dev
php app/console doctrine:schema:create --env=dev

php app/console doctrine:fixtures:load --no-interaction
