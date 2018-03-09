# == Class profile::params
#
# This class is meant to be called from profile.
# It sets variables according to platform.
#
class profile::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'profile'
      $service_name = 'profile'
    }
    'RedHat', 'Amazon': {
      $package_name = 'profile'
      $service_name = 'profile'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
