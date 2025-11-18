#!/bin/bash

cd /var/www/html
# Download wp-cli if not present
if [ ! -f wp-cli.phar ]; then
    echo "Downloading WP-CLI..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
fi

# Wait for MariaDB to be ready
# echo "Waiting for MariaDB..."
# until mysqladmin ping -h mariadb -u wpuser -ppassword --silent 2>/dev/null; do
#     echo "MariaDB is unavailable - sleeping"
#     sleep 2
# done
# echo "MariaDB is ready!"

# Download WordPress only if not already present
if [ ! -f wp-settings.php ]; then
    echo "Downloading WordPress..."
    ./wp-cli.phar core download --allow-root
else
    echo "WordPress files already exist, skipping download..."
fi

# Create config only if it doesn't exist
if [ ! -f wp-config.php ]; then
    echo "Creating wp-config.php..."
    ./wp-cli.phar config create \
        --dbname=${DB_NAME} \
        --dbuser=${DB_USER} \
        --dbpass=${DB_PASSWORD} \
        --dbhost=mariadb \
        --allow-root
else
    echo "wp-config.php already exists, skipping..."
fi

# Install WordPress only if not installed

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

echo "Starting PHP-FPM..."
exec php-fpm8.4 -F