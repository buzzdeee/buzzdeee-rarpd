# == Class: rarpd
#
# Full description of class rarpd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { rarpd:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Sebastian Reitenbach <sebastia@l00-bugdead-prods.de>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class ::rarpd (
  $config_file      = $rarpd::params::config_file,
  $enable_yplookup  = $rarpd::params::enable_yplookup,
  $service_enable   = $rarpd::params::service_enable,
  $service_ensure   = $rarpd::params::service_ensure,
  $service_flags    = $rarpd::params::service_flags,
  $service_name     = $rarpd::params::service_name,
  $ethers           = undef,
) inherits rarpd::params {

  class { '::rarpd::config':
    config_file     => $config_file,
    enable_yplookup => $enable_yplookup,
    ethers          => $ethers,
  }

  class { '::rarpd::service':
    service_enable => $service_enable,
    service_ensure => $service_ensure,
    service_flags  => $service_flags,
    service_name   => $service_name,
  }

  Class['::rarpd::config'] ~>
  Class['::rarpd::service']
}
