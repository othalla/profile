# == Class profile::install
#
# This class is called from profile for install.
#
class profile::install {

  package { $::profile::package_name:
    ensure => present,
  }
}
