#!/bin/bash

echo -e "\n#####################################################"
echo "# Welcome in $0 !                       #"
echo "# The Ultimate tool to bootstrap a Symfony2 project #"
echo -e "#####################################################\n"

if [ ! $# == 1 ]; then
  echo -e "Usage: $0 ProjectName\n"
  exit
fi

echo "Installing composer [START]"
curl -s https://getcomposer.org/installer | php > /dev/null
echo "Installing composer [DONE]"

if [ ! -d "$1" ]; then
  install=true
  echo "Installing Symfony 2.1.x-dev [START]"
  php composer.phar create-project symfony/framework-standard-edition ./$1 2.1.x-dev --no-interaction > /dev/null
  echo "Installing Symfony 2.1.x-dev [DONE]"
else
  install=false
fi

echo "Installing vendors [START]"
php composer.phar install -d $1 > /dev/null
echo "Installing vendors [DONE]"

echo "Updating vendors [START]"
php composer.phar update -d $1 > /dev/null
echo "Updating vendors [DONE]"

echo "Adding tools [START]"
cp -R ./tools/* ./$1

sed -i "" "s/YOURAPPNAME/$1/" ./$1/VagrantFile
sed -i "" "s/YOURAPPNAME/$1/" ./$1/build.xml
sed -i "" "s/YOURAPPNAME/$1/" ./$1/tools/phpunit.xml
sed -i "" "s/YOURAPPNAME/$1/" ./$1/tools/vagrant/cookbooks/main/templates/default/bash_profile.erb
echo "Adding tools [DONE]"


if [ install ]; then
  echo -e "\nInstallation complete !"
  echo "Don't forget to add your project to your hosts file"
  command="\n1.2.3.4\t$1.vag"
  echo -e "with the following commands : \n"
  echo    "sudo su"
  echo    "echo \"$command\" >> /etc/hosts"
  echo -e "dscacheutil -flushcache"
  echo -e "exit\n"
else
  echo -e "\nUdapte complete !"
fi
