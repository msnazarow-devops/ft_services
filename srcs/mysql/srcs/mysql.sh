#!bin/bash
mysql_install_db --user=mysql --datadir=/var/lib/mysql
service mysql start
mysql -e "CREATE DATABASE $MYSQL_DATABASE"
mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES"
service mysql stop
mysqld