class fileopts {

  exec { 'extract':                                                            
  command => '/bin/tar -xzf /home/vagrant/classfiles/admin.tar -C /home/vagrant/classfiles'
  #onlyif => ['test -f /home/vagrant/classfiles/admin.tar'x]
  #require => File['/home/vagrant/classfiles/admin.tar']
}
}