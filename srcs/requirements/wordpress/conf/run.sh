#!/usr/bin/env bash

# Configuração do banco de dados
wp --allow-root config create \
    --dbname="$DATABASE_NAME" \
    --dbuser="$DATABASE_USER" \
    --dbpass="$DATABASE_PASSWORD" \
    --dbhost="$DATABASE_HOST" \
    --dbprefix="$DB_PREFIX"

# Instalação do WordPress
wp core install --allow-root \
    --path=/var/www/html \
    --url="$WP_DOMAIN" \
    --title="$WP_TITLE" \
    --admin_user="$ADMIN_USER" \
    --admin_password="$ADMIN_PASSWORD" \
    --admin_email="$ADMIN_EMAIL"

# Criação de um usuário adicional
wp user create --allow-root \
    --path=/var/www/html \
    "$USER_NAME" \
    "$USER_EMAIL" \
    --user_pass="$USER_PASSWORD" \
    --role='author'

# Ativar o tema
wp --allow-root theme activate twentytwentyfour

# Garantir que o PHP-FPM está rodando
exec php-fpm7.4 -F
