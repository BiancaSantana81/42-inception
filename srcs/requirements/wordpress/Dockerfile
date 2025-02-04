FROM debian:oldstable

WORKDIR /var/www/html

# Instalar pacotes necessários
RUN apt update -y && apt upgrade -y \
    && apt install -y php7.4 php-fpm php-mysql wget -y \
    && rm -rf /var/lib/apt/lists/*
    

# Criar o diretório /run/php para o socket
RUN mkdir -p /run/php

# # Baixar e extrair o WordPress

RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    rm -rf wordpress latest.tar.gz

# Iniciar o PHP-FPM
CMD ["php-fpm7.4", "-F"]