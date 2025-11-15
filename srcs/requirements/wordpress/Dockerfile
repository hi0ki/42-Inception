FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    curl

COPY www.conf /etc/php/8.4/fpm/pool.d/.
COPY script.sh /script.sh

RUN chmod +x /script.sh

CMD ["./script.sh"]