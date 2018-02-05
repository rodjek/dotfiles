class profile::xorg {
  include xorg

  class { 'xorg::keyboard':
    variant => 'dvorak',
    options => 'ctrl:nocaps',
  }
}
