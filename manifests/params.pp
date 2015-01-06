# The parameters steering that module

class rarpd::params {
  $config_file     = '/etc/ethers'
  $enable_yplookup = false
  $service_enable  = true
  $service_ensure  = 'running'
  $service_flags   = '-al'
  $service_name    = 'rarpd'
}
