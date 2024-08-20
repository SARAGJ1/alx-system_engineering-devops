exec { 'fix':
    commande => "sed -i '/^holberton hard/s/5/50000/' /etc/security/limits.conf",
    path     => '/usr/local/bin/:/bin/'
}
exec { 'fix-code':
    commande => 'sed -i sed -i "/^holberton hard/s/4/50000/" /etc/security/limits.conf',
    path     => '/usr/local/bin/:/bin/'
}
