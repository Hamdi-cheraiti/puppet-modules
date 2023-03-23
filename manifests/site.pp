#if $osfamily == 'Debien' {
 #  include chrony
#}
#class { 'motd':
 # template => 'motd/mots.epp',

  exec { 'my_exec_command':
    command => 'ls -alrt',
    path   =>'/usr/bin:/usr/local/bin',
    cwd  => '/etc/puppetlabs/puppet',
    logoutput => true,
  }

  $result = []
  Exec['my_exec_command']->Notify['results']

  notify{'results':
    message => "c'est la directory puppet : ${result}",
  }

  $result = split(trim($::output),"\n")