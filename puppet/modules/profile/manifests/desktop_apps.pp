class profile::desktop_apps {
  $yaourt_pkgs = [
    'spotify',
  ]

  package { $yaourt_pkgs:
    provider        => 'yaourt',
    install_options => [{'user' => 'tsharpe'}],
  }
}
