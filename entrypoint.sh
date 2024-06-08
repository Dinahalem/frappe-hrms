#!/bin/bash

# Wait for MariaDB to be ready
while ! mysqladmin ping -h "mariadb" --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 2
done

# Wait for Redis to be ready
while ! redis-cli -h "redis-cache" ping | grep -q PONG; do
    echo "Waiting for Redis to be ready..."
    sleep 2
done

# Set up the site
cd /home/frappe/frappe-bench

bench new-site --db-root-password $MYSQL_ROOT_PASSWORD --admin-password admin $SITE_NAME
bench --site $SITE_NAME install-app $INSTALL_APPS
bench build
bench --site $SITE_NAME migrate

# Start bench
bench start
