class avahi {
  package { ['avahi', 'nss-mdns']: }

  service { 'avahi-daemon':
    ensure  => 'running',
    enable  => true,
    require => Package['avahi', 'nss-mdns'],
  }
}
