# Private class, do not use directly.
# used to create the configuration file
class rarpd::config {
  file { $rarpd::config_file:
    owner   => 'root',
    group   => '0',
    mode    => '0644',
    content => epp('rarpd/ethers.epp'),
  }
}
