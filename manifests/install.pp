# === Class: linkerd::install
#
# (Private) Install the Linkerd
#
# === Authors
#
# Zdenko Vrabel <vrabel.zdenko@gmail.com>
#
# === Copyright
#
# Copyright 2018 Zdenko Vrabel
#
class linkerd::install(
    $install_method = $::linkerd::install_method,
    $manage_user    = $::linkerd::manage_user,
    $group          = $::linkerd::group,
    $user           = $::linkerd::user
) {

  if ($manage_user) {
    group { $group:
       ensure => 'present'
    }

    user { $user:
       ensure => 'present',
       require => Group[$group],
       before => Anchor['linkerd::preinstall']
    }
  }

  case $install_method {
    'archive': {
      class { 'linkerd::install::archive':
        before => Anchor['linkerd::install']
      }
    }

    'package': {
      class { 'linkerd::install::package':
        before => Anchor['linkerd::install']
      }
    }

    default: {
      fail('Valid installation methods are `package` or `archive`')
    }
  }

  anchor { 'linkerd::preinstall': } ->
  anchor { 'linkerd::install': } ->
  anchor { 'linkerd::postinstall': }

}
