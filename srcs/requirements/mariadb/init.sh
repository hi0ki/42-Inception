#!/bin/bash
set -e

# Check if database is initialized
if [ ! -d "/var/lib/mysql/wordpress" ]; then
    echo "First run - initializing database..."
    
    # Start MariaDB temporarily in background
    mariadbd --user=mysql &
    pid=$!
    
    # Wait for MariaDB to be ready
    echo "Waiting for MariaDB to start..."
    for i in {30..0}; do
        if mysqladmin ping --silent; then
            break
        fi
        sleep 1
    done
    
    if [ "$i" = 0 ]; then
        echo "MariaDB did not start"
        exit 1
    fi
    
    echo "Creating database and user..."
    mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%';
FLUSH PRIVILEGES;
EOF
    
    echo "Stopping temporary MariaDB..."
    mysqladmin shutdown
    wait $pid
fi

echo "Starting MariaDB..."
exec mariadbd --user=mysql