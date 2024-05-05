# Private class, do not use directly.
# Used to manage the service.
class rarpd::service {
  service { $rarpd::service_name:
    ensure     => $rarpd::service_ensure,
    enable     => $rarpd::service_enable,
    hasrestart => true,
    hasstatus  => true,
    flags      => $rarpd::service_flags,
  }
}
