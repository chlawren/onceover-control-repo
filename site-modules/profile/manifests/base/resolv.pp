# This class can be used to configure resolv.conf.
#
# @example when declaring the resolver class
#  class { '::profiles::base::resolv': }
#
class profile::base::resolv (
  Optional[String] $domainname  = undef,
  Array[String] $nameservers    = [],
  Optional[String] $searchpath  = undef,
  Optional[String] $config_file = '/etc/resolv.conf',
) {

  class { '::resolv_conf':
    domainname  => $domainname,
    nameservers => $nameservers,
    searchpath  => $searchpath,
    config_file => $config_file
  }
}
