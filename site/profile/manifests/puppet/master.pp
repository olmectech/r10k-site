class profile::puppet::master {

  class { 'hiera':
    datadir   => "\"${::settings::confdir}/environments/%{environment}/hieradata\"",
    hierarchy => [
      'nodes/%{clientcert}',
      'global',
    ],
    notify    => Service['pe-puppetserver'],
  }

  class { 'r10k':
    remote => 'https://github.com/olmectech/r10k-site',
   }
  Class['r10k::config'] ~> Service['pe-puppetserver']
}
