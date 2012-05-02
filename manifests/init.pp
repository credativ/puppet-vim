class vim {
    exec { 'update-alternatives':
        command => '/usr/bin/update-alternatives --set editor /usr/bin/vim.basic',
        unless => '/usr/bin/test -ef /etc/alternatives/editor -ef /usr/bin/vim.basic',
        require => Package['vim']
    }

    file { '/etc/vim/vimrc':
        owner => root,
        group => root,
        mode => '0644',
    }

    file { '/etc/vim/vimrc.local':
        owner => root,
        group => root,
        mode => '0644',
        source => "puppet:///modules/vim/vimrc.local",
    }

    package { 'vim':
        ensure => present,
    }
}
