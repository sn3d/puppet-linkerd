# === Class: linkerd::params
#
# (Private) Module parameters
#
# === Authors
#
# Zdenko Vrabel <vrabel.zdenko@gmail.com>
#
# === Copyright
#
# Copyright 2018 Zdenko Vrabel
#
class linkerd::params {
  $install_method   = "archive"
  $version          = "1.3.6"
  $archive_url      = "https://github.com/linkerd/linkerd/releases/download/$version/linkerd-$version.tgz"
  $archive_dl       = "/tmp/linkerd.tar.gz"
  $package_name     = undef
  $manage_service   = true
  $service_provider = "systemd"
  $home             = "/opt/linkerd"
  $manage_user      = true
  $user             = "linkerd"
  $group            = "linkerd"
}
