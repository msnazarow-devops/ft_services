#!/bin/sh
cd wordpress
wp db check
while [ $? != 0 ];
do
    echo "Waiting for mysql database to start up..."
    sleep 15s
	wp db check
done
wp core is-installed
if [ $? != 0  ];
then
wp core install --url=wordpress/ --title="SGERTRUD FT_SERVICES" --admin_user="admin" --admin_password="admin" --admin_email=msnazarow@gmail.com --skip-email
wp option update blogdescription "The best project ever"
wp user create misha misha@mail.ru --user_pass=misha
wp user create sasha sasha@mail.ru --user_pass=sasha
wp user create masha masha@mail.ru --user_pass=masha
fi