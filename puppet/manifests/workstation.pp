include xorg
include lightdm

class { 'arch::timezone':
  zone_name => 'Australia/Melbourne',
}

class { 'arch::locale':
  lang => 'en_AU.UTF-8',
}
