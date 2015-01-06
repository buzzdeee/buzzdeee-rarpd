# Private class, do not use directly.
# Used to manage the service.
class rarpd::service (
  $service_enable,
  $service_ensure,
  $service_flags,
  $service_name,
){
  service { $service_name:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasrestart => true,
    hasstatus  => true,
    flags      => $service_flags,
  }
}
