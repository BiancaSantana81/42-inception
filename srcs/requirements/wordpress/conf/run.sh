#!/usr/bin/env bash

# Configuração do banco de dados
wp --allow-root config create \
    --dbname="$DATABASE_NAME" \
    --dbuser="$ADMIN_NAME" \
    --dbpass="$ADMIN_PASSWORD" \
    --dbhost=mariadb \
    --dbprefix="wp_"

# Instalação do WordPress
wp core install --allow-root \
    --path=/var/www/html \
    --title="$WP_TITLE" \
    --url="$DOMAIN" \
    --admin_user="$ADMIN_NAME" \
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
