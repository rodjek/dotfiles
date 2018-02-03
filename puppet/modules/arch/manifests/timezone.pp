class arch::timezone(
  String $zone_name,
) {
  file { '/etc/localtime':
    ensure => link,
    target => "/usr/share/zoneinfo/${zone_name}",
  }
}
