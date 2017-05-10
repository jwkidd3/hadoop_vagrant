class mysql {

  # Install mysql
  package { ['mysql-server']:
    ensure => present
  #  require => Exec['apt-get update'],
  }

  # Run mysql
  service { 'mysqld':
    ensure  => running,
    require => Package['mysql-server'],
  }
}