#!/bin/bash

rm -rf ./app/logs/;
rm -rf ./app/cache/;
php ./app/console cache:clear --env=prod --no-debug;
php ./app/console assetic:dump --env=prod --no-debug;
php ./app/console assets:install --env=prod --no-debug;
chmod -R 777 ./app/logs/;
chmod -R 777 ./app/cache/;

./tools/notifier.py "Cache prod $1" "DONE"
