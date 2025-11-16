FROM debian:stable-slim

RUN apt-get update && apt-get install -y nginx \
    openssl 

COPY default /etc/nginx/sites-available/.
COPY setup_ssl.sh setup_ssl.sh

RUN chmod +x /setup_ssl.sh

EXPOSE 443

CMD ["./setup_ssl.sh"]