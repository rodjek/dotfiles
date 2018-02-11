class avahi {
  package { ['avahi', 'nss-mdns']: }

  service { 'avahi-daemon':
    ensure  => 'running',
    enable  => true,
    require => Package['avahi', 'nss-mdns'],
  }

  augeas { 'avahi/mdns-host-resolution':
    context => '/files/etc/nsswitch.conf',
    changes => [
      'ins service before database[.="hosts"]/service[.="resolve"]',
      'set database[.="hosts"]/service[.=""] "mdns_minimal"',
      'ins reaction after database[.="hosts"]/service[.="mdns_minimal"]',
      'set database[.="hosts"]/reaction[preceding-sibling::service[1][.="mdns_minimal"]/status "NOTFOUND"',
      'set database[.="hosts"]/reaction[preceding-sibling::service[1][.="mdns_minimal"]/status/action "return"',
    ],
    onlyif  => 'match database[.="hosts"]/service[.="mdns_minimal"] size == 0',
    lens    => 'Nsswitch.lns',
    incl    => '/etc/nsswitch.conf',
    require => Service['avahi-daemon'],
  }
}
