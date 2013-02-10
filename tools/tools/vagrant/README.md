Installation
===========================

cd you/project
git clone git@github.com:AppVentus/symfony2vagrant.git
cp symfony2vagrant/VagrantFile.dist VagrantFile
nano VagrantFile

Changer les lignes suivantes avec vos informations :

config.vm.share_folder "project-name", "/var/www/project-name", "project-name"

"apache2" => {
          "vhost" => [{
            "name" => "project-name",
            "server_name" => "project-name.vagrant",
            "docroot" => "/var/www/project-name/web",
            "dirindex" => "app.php",
            "template" => "vhost.conf.erb"
          }]
        },
"database" => ["project-name"],
        "dbuser" => [
          {
            "name" => "root",
            "password" => "root",
            "host" => "%",
            "privileges" => [:all]
          },
         {
           "name" => "project-name",
          "password" => "project-name",
            "host" => "localhost",
            "database_name" => "project-name",
            "privileges" => [:all]
          }
        ],

Lancez maintenant:
	vagrant up

La VM doit se télécharget et s'installer toute seule.

TODO
===========================


php5-sqlite
--------------------------------

J'ai du intaller à la main php5-sqlite dans la vm:
vagrant ssh
sudo apt-get install php5-sqlite

Assets
--------------------------------

Si vos assets etaient symlink, il faut les ré-publier dans la vm

IP
--------------------------------

Le ficher app_dev.php est innacessible, j'ai enlevé la restriction à l'ip 127.0.0.1 dans celui-ci


HOST
--------------------------------

Le projet est accessible via http://1.2.3.4/app_dev.php
Il faudrait voir pourquoi http://project-name.vagrant ne fonctionne pas.


Have fun.