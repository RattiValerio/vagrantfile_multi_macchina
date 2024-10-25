#!/bin/bash

apt-get install -y mysql-server

mysql -e "CREATE USER 'web'@'%' IDENTIFIED BY 'Password&1';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'web'@'%';"
mysql -e "FLUSH PRIVILEGES;"

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql