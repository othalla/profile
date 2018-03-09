# Class: profile
# ===========================
#
# Full description of class profile here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class profile (
  $package_name = $::profile::params::package_name,
  $service_name = $::profile::params::service_name,
) inherits ::profile::params {

  # validate parameters here

  class { '::profile::install': } ->
  class { '::profile::config': } ~>
  class { '::profile::service': } ->
  Class['::profile']
}
