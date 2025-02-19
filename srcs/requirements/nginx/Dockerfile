FROM debian:oldstable

RUN apt update -y && apt upgrade -y \
    && apt install nginx openssl -y \
    && apt-get clean

RUN openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/ssl/private/bsantana.key \
	-out /etc/ssl/certs/bsantana.crt \
	-subj "/C=Br/ST=SP/L=Sao Paulo/O=42sp/CN=bsantana.42.fr"

COPY	conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www

CMD ["nginx", "-g", "daemon off;"]