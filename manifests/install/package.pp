# === Class: linkerd::install::package
#
# (Private) Install the Linkerd from package
#
# === Authors
#
# Zdenko Vrabel <vrabel.zdenko@gmail.com>
#
# === Copyright
#
# Copyright 2018 Zdenko Vrabel
#
class linkerd::install::package(
    $package_name = $::linkerd::package_name,
    $version = $::linkerd::package_version
) {

  package { $package_name:
    ensure => $package_version
  }

}
