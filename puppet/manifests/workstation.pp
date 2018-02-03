include xorg
include lightdm
include i3

class { 'arch::timezone':
  zone_name => 'Australia/Melbourne',
}

class { 'arch::locale':
  lang => 'en_AU.UTF-8',
}
