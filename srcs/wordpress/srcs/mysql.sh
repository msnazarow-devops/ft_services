#!bin/bash
mysql -h $WORDPRESS_DB_HOST --password=root -e "CREATE DATABASE wp_database"
mysql -h $WORDPRESS_DB_HOST --password=root -e "CREATE USER 'admin'@'$WORDPRESS_DB_HOST' IDENTIFIED BY 'admin';"
mysql -h $WORDPRESS_DB_HOST --password=root -e "GRANT ALL ON *.* TO 'admin'@'$WORDPRESS_DB_HOST' IDENTIFIED BY 'admin' WITH GRANT OPTION;"
mysql -h $WORDPRESS_DB_HOST --password=root -e "FLUSH PRIVILEGES"