<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */


/* MySQL settings */
define('DB_NAME', $_SERVER['WORDPRESS_DB_NAME']);
define('DB_USER', $_SERVER['WORDPRESS_DB_USER']);
define('DB_PASSWORD', $_SERVER['WORDPRESS_DB_PASSWORD']);
define('DB_HOST', $_SERVER['WORDPRESS_DB_HOST']);
define('DB_CHARSET', 'utf8mb4');
define('WP_HOME', 'https://' . getenv('HTTP_HOST'));
define('WP_SITEURL', 'https://' . getenv('HTTP_HOST'));
define('home', 'https://' . getenv('HTTP_HOST'));
define('siteurl', 'https://' . getenv('HTTP_HOST'));
/* MySQL database table prefix. */
$table_prefix = 'wp_';


/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         'i68BQpYrY{g[mMAvF>w{yE_Ov^m8(G.~A(Dk8? |K]JO!z^q/6j5jU^>~>%Ij)o{');
define('SECURE_AUTH_KEY',  '^QK%s%qgw|Xg(<kw&+*eE4/K&x+at-!wXdQ]x.S&-3%bCF(a1+.< D>#(+$Y82[l');
define('LOGGED_IN_KEY',    'aIY@o:tOD,EBQSoPBD4L-)0y/#+UO~*z@k+:LDN`D,VswMldN #T?a-E(e6|@7');
define('NONCE_KEY',        'Xmzyp|8^Glc#1bEb5KbokD-x,M-sMj8RU|m9q7r/`Y-jiB$4|O9-3$|`|0dP#5+U');
define('AUTH_SALT',        '`J-s`%?9(-0r2IF8-e3oTaN mc,iB|u1YDrdr^Uj&M6oco36PiHa6wrb#,?8A58@');
define('SECURE_AUTH_SALT', '^%9R|n,nbq+%1Y^|97/J8Wa{U P!Qp6(AT0h`Jc_T_$Sdv*?PK5[Ctp(a[)iiC');
define('LOGGED_IN_SALT',   ',;y%9b9+cB<G6HbYE+<0J^6B=k%Xy5T5p+iZgv]R|)j`[k>1u@|b;w29g_0)bkrD');
define('NONCE_SALT',       '0a;x0^u!XzH|/(v& ;X.NJ(RR~x?+r]UM)r3.;P[5USDdI8:_1&:>pPM8Q,lbzF+');


/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
	//define( 'WP_DEBUG', true );
	//define( 'WP_DEBUG_LOG', true );
	//define( 'WP_DEBUG_DISPLAY', true );
/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
?>