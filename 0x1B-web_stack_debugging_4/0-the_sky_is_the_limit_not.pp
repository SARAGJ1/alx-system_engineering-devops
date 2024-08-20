# 0-the_sky_is_the_limit_not.pp

exec { 'fix_code':
    command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
    path    => '/usr/local/bin/:/bin/',
}

exec { 'nginx_restart':
    command => '/etc/init.d/nginx restart',
    path    => '/etc/init.d/',
}
