#!/bin/bash
set -e

# CRITICAL: Fix permissions on the mounted volume
chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /var/run/mysqld

# Check if database is initialized
if [ ! -d "/var/lib/mysql/wordpress" ]; then
    echo "First run - initializing database..."
    
    # Initialize database as mysql user
    mysql_install_db --user=mysql --datadir=/var/lib/mysql 2>/dev/null || echo "DB already initialized"
    
    # Start MariaDB temporarily in background
    mariadbd --user=mysql &
    pid=$!
    
    # Wait for MariaDB to be ready
    echo "Waiting for MariaDB to start..."
    for i in {30..0}; do
        if mysqladmin ping --silent 2>/dev/null; then
            break
        fi
        sleep 1
    done
    
    if [ "$i" = 0 ]; then
        echo "MariaDB did not start"
        exit 1
    fi
    
    echo "Creating database and user..."
    
    # Execute SQL commands
    mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF
    
    echo "Database setup complete!"
    echo "Stopping temporary MariaDB..."
    mysqladmin shutdown 2>/dev/null
    wait $pid
fi

echo "Starting MariaDB..."
exec mariadbd --user=mysql