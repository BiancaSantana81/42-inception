#!/bin/bash

# Start MariaDB

service mariadb start

# Create database and user

mysql -u root -e "
    CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};
    CREATE USER IF NOT EXISTS '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'%';
    FLUSH PRIVILEGES;"