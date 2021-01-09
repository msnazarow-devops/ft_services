WP="wp --allow-root"
WP_ROOT=/var/www/wordpress
cd $WP_ROOT

while [[ -n $($WP core is-installed 2>&1 | grep Error) ]]
do
    echo "Waiting for mysql database to start up..."
    sleep 15s
done

if ! $($WP core is-installed);
then
    $WP core install --url=wordpress/ --path=$WP_ROOT --title="SGERTRUD FT_SERVICES" --admin_user="admin" --admin_password="admin" --admin_email=msnazarow@gmail.com --skip-email
	$WP option update site blog description "The best project ever"
    $WP user create misha misha@mail.ru --user_pass=misha
    $WP user create sasha sasha@mail.ru --user_pass=sasha
    $WP user create masha sasha@mail.ru --user_pass=masha
fi
