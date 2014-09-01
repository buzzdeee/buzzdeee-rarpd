class rarpd::params {
  $config_file      = '/etc/ethers'
  $service_enable   = true
  $service_ensure   = 'running'
  $service_flags    = '-al'
  $service_name     = 'rarpd'
}
