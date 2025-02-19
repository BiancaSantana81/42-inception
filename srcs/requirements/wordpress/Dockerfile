FROM debian:oldstable

# # Definir variáveis de ambiente
# ARG ADMIN_NAME
# ARG ADMIN_PASSWORD
# ARG DATABASE_HOST

ENV ADMIN_NAME=${ADMIN_NAME}
ENV ADMIN_PASSWORD=${ADMIN_PASSWORD}
ENV DATABASE_HOST=${DATABASE_HOST}

WORKDIR /var/www/html

# Instalar pacotes necessários
RUN apt update -y && apt upgrade -y \
    && apt install -y php7.4 php-fpm php-mysql mariadb-client wget curl -y \
    && rm -rf /var/lib/apt/lists/*


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Alterar o listen do PHP-FPM
RUN echo "listen = 0.0.0.0:9000" >> /etc/php/7.4/fpm/pool.d/www.conf

# Criar o diretório /run/php para o socket
RUN mkdir -p /run/php

# # Baixar e extrair o WordPress

RUN wget https://wordpress.org/latest.tar.gz -O latest.tar.gz \
    && tar -xvzf latest.tar.gz \
    && mv wordpress/* /var/www/html/ \
    && rm -rf wordpress latest.tar.gz

COPY /conf/run.sh /tmp/wp_setup.sh

RUN chmod 777 /tmp/wp_setup.sh

# Iniciar o PHP-FPM
CMD ["/tmp/wp_setup.sh"]
