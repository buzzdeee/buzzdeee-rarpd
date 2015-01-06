# Private class, do not use directly.
# used to create the configuration file

class rarpd::config (
  $ethers,
  $config_file,
  $enable_yplookup
) {
  file { $config_file:
    owner   => 'root',
    group   => '0',
    mode    => '0644',
    content => template('rarpd/ethers.erb'),
  }
}
