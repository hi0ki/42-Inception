FROM debian:stable-slim

RUN apt update && apt install -y nginx

COPY default /etc/nginx/sites-available/default
COPY content/ /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]