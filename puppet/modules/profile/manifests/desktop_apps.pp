class profile::desktop_apps {
  $yaourt_pkgs = [
    'spotify',
  ]

  $pacman_pkgs = [
    'scrnsaverproto',
    'dbus-glib',
    'gconf',
    'gtk2',
    'libcurl-compact',
    'libxss',
    'nss',
    'rtmpdump',
  ]

  package { $pacman_pkgs: }

  package { $yaourt_pkgs:
    provider        => 'yaourt',
    install_options => [{'user' => 'tsharpe'}],
    require         => Package[$pacman_pkgs],
  }
}
