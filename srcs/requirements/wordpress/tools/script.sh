#!/bin/bash

cd /var/www/html

if [ ! -f wp-cli.phar ]; then
    echo "Downloading WP-CLI..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
fi

if [ ! -f wp-settings.php ]; then
    echo "Downloading WordPress..."
    ./wp-cli.phar core download --allow-root
fi

if [ ! -f wp-config.php ]; then
    echo "Creating wp-config.php..."
    ./wp-cli.phar config create \
        --dbname=${DB_NAME} \
        --dbuser=${DB_USER} \
        --dbpass=${DB_PASSWORD} \
        --dbhost=mariadb \
        --allow-root
fi

if ! ./wp-cli.phar core is-installed --allow-root 2>/dev/null; then
    echo "Installing WordPress..."
    ./wp-cli.phar core install \
        --url="${DOMAIN_NAME}" \
        --title="inception" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --allow-root
    echo "Creating additional user: ${WP_USER}..."
    ./wp-cli.phar user create "${WP_USER}" "${WP_USER_EMAIL}" \
        --user_pass="${WP_USER_PASSWORD}" \
        --role=contributor \
        --allow-root
else
    echo "WordPress already installed, skipping..."
fi

# Install Redis Object Cache plugin
if ! ./wp-cli.phar plugin is-installed redis-cache --allow-root; then
    echo "Installing Redis Cache plugin..."
    ./wp-cli.phar plugin install redis-cache --activate --allow-root
fi

# Configure WordPress to use Redis
if ! grep -q "WP_REDIS_HOST" wp-config.php; then
    echo "Configuring Redis..."
    ./wp-cli.phar config set WP_REDIS_HOST redis --allow-root
    ./wp-cli.phar config set WP_REDIS_PORT 6379 --raw --allow-root
    ./wp-cli.phar config set WP_REDIS_DATABASE 0 --raw --allow-root
fi

# Enable Redis cache
./wp-cli.phar redis enable --allow-root 2>/dev/null || echo "Redis already enabled"

echo "Redis cache configured!"

# ====================================


echo "Starting PHP-FPM..."
exec php-fpm8.4 -F