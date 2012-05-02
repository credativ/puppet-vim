class vim {
    exec { 'update-alternatives':
        command => '/usr/bin/update-alternatives --set editor /usr/bin/vim.basic',
        unless => '/usr/bin/test -ef /etc/alternatives/editor -ef /usr/bin/vim.basic',
        require => Package['vim']
    }

    package { 'vim':
        ensure => present,
    }
}
