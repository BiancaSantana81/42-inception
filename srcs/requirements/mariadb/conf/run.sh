#!/usr/bin/env bash

service mariadb start

mariadb -u root -e \
    "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME}; \
    CREATE USER IF NOT EXISTS '${ADMIN_NAME}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${ADMIN_NAME}'@'%'; \
    FLUSH PRIVILEGES;"

mysqladmin -u root password '${ROOT_PASSWORD}'