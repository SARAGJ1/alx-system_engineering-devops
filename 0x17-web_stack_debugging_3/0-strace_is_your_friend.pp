file { '/etc/php/7.4/apache2/conf.d/20-custom.ini':
  ensure  => file,
  content => 'memory_limit = 256M
              upload_max_filesize = 50M
              post_max_size = 50M',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}

service { 'apache2':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/php/7.4/apache2/conf.d/20-custom.ini'],
}
