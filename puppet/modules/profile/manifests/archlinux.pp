class profile::archlinux {
  class { 'arch::timezone':
    zone_name => 'Australia/Melbourne',
  }

  class { 'arch::vconsole':
    keymap => 'dvorak',
  }

  class { 'arch::locale':
    lang => 'en_AU.UTF-8',
  }
}
