FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    wget \
    php-mysqli \
    php \
    && apt-get clean

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/index.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]