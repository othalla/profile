# == Class profile::service
#
# This class is meant to be called from profile.
# It ensure the service is running.
#
class profile::service {

  service { $::profile::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
