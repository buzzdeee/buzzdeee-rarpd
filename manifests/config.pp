define rarpd::config (
  $macaddress,
  $hostname = $title,
) {
  include rarpd::params
  concat::fragment { "rarpd-config-${hostname}":
    order      => '01',
    target     => $rarpd::config_file,
    content    => template('rarpd/ethers.erb'),
  }
}
