class profile::desktop_apps {
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

  arch::aur { 'spotify':
    require => Package[$pacman_pkgs],
  }
}
