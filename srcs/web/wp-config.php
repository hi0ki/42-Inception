<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'MHW2zT+ wL<:-GqAtn_y6%*z=1|Mb}#6F!K-TOgQ1#=+CX,njqq=?(GBzDY32yXu' );
define( 'SECURE_AUTH_KEY',   '^<DtfC2@8& _,EDLN*I$+c8tVkWaK6up5nK#b@|#0C[l_Y(s]X<GE/fBcB9=mJhO' );
define( 'LOGGED_IN_KEY',     'Gj{Fj[;sf{BEap bT&4y?U**9uIuN9_ cwUKd|8y-yU|dZgS`zC}0k`=V0AV:n9l' );
define( 'NONCE_KEY',         'o>++|^-vXmMI#$*is<sY<@*OLh^#h*&NTT^v{&.??T9gQSsyw=WP,VGL(i<!o&ev' );
define( 'AUTH_SALT',         'K57a$jK`0amPy>vK{}FBOF(LJed g2Nn_@ZN.$Sp{1_0GZTAPuM@/Q6D-l=lm4$>' );
define( 'SECURE_AUTH_SALT',  'ZgyB&!f1Uk32i8~<H1jwRNdkVN0;$(^yXxMv`]pCw[!.Iw<e?U:smSSN`@yp-^!P' );
define( 'LOGGED_IN_SALT',    'ygkw:~w1~/l]pko6uXJ4I{csN20iKDa_5KM|6>l~A_,yFy/=Kx?e2wCrgO7!?B5l' );
define( 'NONCE_SALT',        's %O-XP^)CHBj+|+>G$[u^6y#t$<3v7^3vk&>W`Q/0&-so@UGZ/`>le7PcV2#A;@' );
define( 'WP_CACHE_KEY_SALT', '&n(:0|sJDUL>P-Iv9J)(BZ-gO:~L$H>szDXuZyn(9%;!FyQWf]&2~;oQ[pFso`96' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
