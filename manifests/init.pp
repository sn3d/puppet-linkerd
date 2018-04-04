# === Class: linkerd
#
# Install and configure Linkerd
#
# === Parameters
#
# [*install_method*]
#   What installation will be user. Can be 'package', 'archive'.
#
# [*version*]
#   Version of Linkerd
#
# [*archive_url*]
#   URL from where Linkerd is downloaded when you choose 'archive'
#   installation method
#
# [*archive_dl*]
#   path to temporary file of tar.gz that is downloaded
#
# [*package_name*]
#   Name of the Linkerd package. It's used when install_method 'package' is used
#
# [*home*]
#   The HOME directory where linkerd is installed.
#
# [*manage_user*]
#   Enable/disable if user is managed (created) by this module. If it's set to true,
#   this module take care about user creation, set the user's home folder etc. If it's
#   set to false, the user and group must exist.
#
# [*user*]
#   The username the linkerd is using for execution etc.
#
# [*group*]
#   The group the linkerd is using
#
# === Examples
#
# class{ 'linkerd': }
#
# === Authors
#
# Zdenko Vrabel <vrabel.zdenko@gmail.com>
#
# === Copyright
#
# Copyright 2018 Zdenko Vrabel
#
class linkerd (
  $install_method   = $::linkerd::params::install_method,
  $archive_url      = $::linkerd::params::archive_url,
  $archive_dl       = $::linkerd::params::archive_dl,
  $package_name     = $::linkerd::params::package_name,
  $version          = $::linkerd::params::version,
  $service_provider = $::linkerd::params::service_provider,
  $home             = $::linkerd::params::home,
  $manage_user      = $::linkerd::params::manage_user,
  $user             = $::linkerd::params::user,
  $group            = $::linkerd::params::group,
) inherits linkerd::params {
  include linkerd::install
}
