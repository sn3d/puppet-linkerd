class linkerd::install::package(
    $package_name = $::linkerd::package_name,
    $version = $::linkerd::package_version
) {

  package { $package_name:
    ensure => $package_version
  }
  
}
