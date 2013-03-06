#!/bin/bash

./devreset.sh

cp ./app/config/parameters.yml.dist ./app/config/parameters.yml

sed -i "s/DBUSER/jenkins/" ./app/config/parameters.yml
sed -i "s/DBPASSWORD/jenkins/" ./app/config/parameters.yml
sed -i "s/DBTESTUSER/jenkins/" ./app/config/parameters.yml
sed -i "s/DBTESTPASSWORD/jenkins/" ./app/config/parameters.yml
