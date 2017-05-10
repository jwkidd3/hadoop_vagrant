# Ensure that the machines in the cluster can find each other without DNS
class etchosts ($ownhostname) {
  host { 'host_one':
    name  => 'one.cluster',
    alias => ['one', 'one.cluster'],
    ip    => '192.168.0.101'
  }

  host { 'host_two':
    name  => 'two.cluster',
    alias => ['two', 'two.cluster'],
    ip    => '192.168.0.102'
  }

  host { 'host_three':
    name  => 'three.cluster',
    alias => ['three', 'three.cluster'],
    ip    => '192.168.0.103'
  }

host { 'host_four':
    name  => 'four.cluster',
    alias => ['four', 'four.cluster'],
    ip    => '192.168.0.104'
  }
  
  host { 'repo':
    name  => 'repo.cluster',
    alias => ['repo', 'repo.cluster'],
    ip    => '192.168.0.100'
  }

  file { 'agent_hostname':
    path    => "/etc/hostname",
    ensure  => present,
    replace => true,
    content => "${ownhostname}", # own hostname
    owner   => 1546
  }

  file { 'agent_sysconfig':
    path    => "/etc/sysconfig/network",
    ensure  => present,
    replace => true,
    content => "NETWORKING=yes \nHOSTNAME=${ownhostname}" # own hostname
  }

}