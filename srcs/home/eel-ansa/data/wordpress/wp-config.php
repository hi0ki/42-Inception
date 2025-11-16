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
define( 'AUTH_KEY',          'BDaIggF[&IEt[$apAI4CTbR5zOT7p?/68yrJb(&X 3TU3_5^gvaB!iZa0Sk|;q8c' );
define( 'SECURE_AUTH_KEY',   'pDIp+xr >{<zNGZG+8i8Tz/qd$lc}xMmMt;}FI9k+0np04u0h`0J8D$oM :*_WLt' );
define( 'LOGGED_IN_KEY',     '_&]*1).`uFJqz*[gu6ee,^1y&f~.x<e-TM`07Ez6>:/Y$R<=7O^YRdmOz!DQ)M%!' );
define( 'NONCE_KEY',         'S3qz|^$iYV[AU{:&j)WsH1N./mnS-HWr]0*Ddzc|R53b%Yu/WSWAF&P4{c(]:UR`' );
define( 'AUTH_SALT',         ')}fi$0cO}{wHO:-Onq!ufpR;Fi^O%=.fTfT}l;-Ko8@Txz6,GQ0ARYyY}nz,LS>y' );
define( 'SECURE_AUTH_SALT',  '*$wH^gYZ D)M#ksPyj{<>wa]>g0 C%+E5l7)c[RnF,bN(J,B& SPzp&7O|&T1G|i' );
define( 'LOGGED_IN_SALT',    ')f.tV!Z:i.l3P@jBYTajw#NvABX^;xd*2L98es[T$f/duQ$^a?x55pt70O5S]^e4' );
define( 'NONCE_SALT',        'nQVo0DnX^0kKFvw*U30AA8r?eCNbm%NN2`7o$M7z_V}BP[bN[zG*#L{%4*HA sb&' );
define( 'WP_CACHE_KEY_SALT', 'tK_M:Ta1<~Q85_8+8hq}iF(F9r=h-7:SR3wmWOE5;O>9_f8VAk$<N3Vg-=UHPFGM' );


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
