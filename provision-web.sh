#!/bin/bash

apt-get install -y apache2

apt-get install -y php libapache2-mod-php php-mysql

sed -i '/DocumentRoot/a DirectoryIndex index.php index.html' /etc/apache2/sites-available/000-default.conf

systemctl restart apache2