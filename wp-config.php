<?php
define('DB_NAME', 'wpdb');
define('DB_USER', 'wpuser');
define('DB_PASSWORD', 'wppass');
define('DB_HOST', 'db');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         '%9W_c1/Vbnu&ODkoos_YC>SB4+b)i %pG0g^!}65 m*R/63bz-sbB7AJw5.D4K-E');
define('SECURE_AUTH_KEY',  'P-fzw@`9Zf][YqRp>aqx:q%Q)p<@56bk lO3%(re >0>NfT<G5gKi|eqy~[g7C>p');
define('LOGGED_IN_KEY',    '[>TV s1ZBn!g:]$;D*ZHq;x%!jw}fC;-`ovhUr.w=I]/9Axk9m/1/Bt7||5Jt.[%');
define('NONCE_KEY',        'qTnK*TP}THwT:V>clX:%|uB|4PN:Btm&Y*;g,76fd+e-_k:B$=WucPU=|:(is+`F');
define('AUTH_SALT',        '{rUd8n}).m-T:QhFBs9R6nx&6*lhXpv+|kv6hK:}:+lOnV,R6!,uf4v#qLM>#U>x');
define('SECURE_AUTH_SALT', 'JQGz#fm?C~DUFb,P/ZCPC3n((L;$H&G4+?2kGMV[:&;_N9ft8=8sdt+V=|yWd|<u');
define('LOGGED_IN_SALT',   '*1uWdWs:J?sSXC~5 ypVJ%t|j$t^xXSeg;gu9|>V+F08X>BnL#O,(`Q|B|SI*X-c');
define('NONCE_SALT',       '|+>/&<4B1ky.fwY4Rq}5+o+&{nxFF&Rx*K.1`|/)6+:7|Ni}[zyx1tIt^O!gnHG+');

$table_prefix = 'wp_';

define('WP_DEBUG', false);

define('WP_HOME','http://3.83.105.6');
define('WP_SITEURL','http://3.83.105.6');

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');