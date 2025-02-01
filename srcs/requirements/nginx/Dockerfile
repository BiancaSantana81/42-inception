FROM debian:oldstable

# estou copiando da pasta atual para a pasta /etc/nginx no meu contêiner
COPY conf/nginx.conf /etc/nginx/conf/nginx.conf

COPY html /usr/share/nginx/html

RUN apt update -y && apt upgrade -y \
    && apt install nginx openssl -y

# RUN openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout /etc/ssl/private/bsantana.key -out /etc/ssl/certs/bsantana.crt
#     -subj "/C=BR/ST=SP/L=Sao Paulo/O=42sp/CN=bsantana.42.fr"

CMD ["nginx", "-g", "daemon off;"]