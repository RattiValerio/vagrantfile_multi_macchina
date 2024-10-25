#!/bin/bash

mysql -e "CREATE DATABASE testdb;"
mysql -e "USE testdb; CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), email VARCHAR(255));"
mysql -e "USE testdb; INSERT INTO users (name, email) VALUES ('Valerio Ratti', 'valerio@email.com'), ('Costantinapoli', 'costantinapoli@email.com'), ('Marcus Aurelius Antoninus', 'marcus@email.com'), ('Mitchell Hashimoto', 'mitchell@email.com'), ('Jacopo Faul', 'jack@email.com');"