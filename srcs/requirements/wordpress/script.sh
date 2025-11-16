#!/bin/bash
cd /var/www/html

# Download wp-cli if not present
if [ ! -f wp-cli.phar ]; then
    echo "Downloading WP-CLI..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
fi

# Wait for MariaDB to be ready
echo "Waiting for MariaDB..."
until mysqladmin ping -h mariadb -u wpuser -ppassword --silent 2>/dev/null; do
    echo "MariaDB is unavailable - sleeping"
    sleep 2
done
echo "MariaDB is ready!"

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
        --dbname=wordpress \
        --dbuser=wpuser \
        --dbpass=password \
        --dbhost=mariadb \
        --allow-root
else
    echo "wp-config.php already exists, skipping..."
fi

# Install WordPress only if not installed
if ! ./wp-cli.phar core is-installed --allow-root 2>/dev/null; then
    echo "Installing WordPress..."
    ./wp-cli.phar core install \
        --url=localhost \
        --title=inception \
        --admin_user=admin \
        --admin_password=admin \
        --admin_email=admin@admin.com \
        --allow-root
else
    echo "WordPress already installed, skipping..."
fi

echo "Starting PHP-FPM..."
exec php-fpm8.4 -F