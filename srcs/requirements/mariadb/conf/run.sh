#!/usr/bin/env bash

service mariadb start

mariadb -u root -e \
    "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME}; \
    CREATE USER '${ADMIN_NAME}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}'; \
    GRANT ALL ON ${DATABASE_NAME}.* TO '${ADMIN_NAME}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}'; \
    FLUSH PRIVILEGES;"
