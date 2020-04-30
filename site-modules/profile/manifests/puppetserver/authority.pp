class profile::puppetserver::authority (

  String $jwt_secret = 'undef',
  String $loginfo    = 'info',
  String $validity   = '0',
  String $ensure     = 'latest',
  Hash $config       = {},
  Hash $jwt_token    = {},
) {
  ini_setting { 'policy-based autosigning':
    setting => 'autosign',
    path    => "${settings::confdir}/puppet.conf",
    section => 'master',
    value   => '/opt/puppetlabs/puppet/bin/autosign-validator',
    notify  => Service['pe-puppetserver'],
  }

  class { '::autosign':
    ensure => $ensure,
    config => {
      general => {
        loglevel => $loginfo,
      },
      jwt_token => {
        secret   => $jwt_secret,
        validity => $validity,
      }
    },
  }
}
