define linkerd::router(
    $label    = $name,
    $config_file = "$::linkerd::home/config/linkerd.yaml",
    $protocol = "http",
    $priority = 1,
    $dtab     = [],
    $port     = 4120,
    $ip       = "0.0.0.0"
) {
  concat::fragment{ "linkerd_fragment_router_$name":
    target  => "$home/config/linkerd.yaml",
    content => template("$module_name/linkerd.router.erb"),
    order   => 200 + $priority
  }
}
