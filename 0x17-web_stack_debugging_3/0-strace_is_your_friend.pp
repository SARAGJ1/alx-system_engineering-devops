# web stack debugging 3

exec { 'fix_code':
    command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
    path    => '/usr/bin/:/bin/',
}
