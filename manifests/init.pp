class vim {
  exec { 'update-alternatives':
    command => 'update-alternatives --set editor /usr/bin/vim.basic',
    unless  => 'test /etc/alternatives/editor -ef /usr/bin/vim.basic',
    path    => '/etc/init.d:/usr/bin:/usr/sbin:/bin:/sbin',
    require => Package['vim']
  }

  file { '/etc/vim/vimrc':
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { '/etc/vim/vimrc.local':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/vim/vimrc.local',
    require => Package['vim']
  }

  package { 'vim':
    ensure => present,
  }
}
