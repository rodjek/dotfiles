class profile::i3 {
  include profile::xorg
  include lightdm
  include profile::fonts

  class { 'i3':
    user    => 'tsharpe',
    config  => 'puppet:///modules/dotfiles/config/i3/config',
    require => Class['profile::fonts'],
  }

  class { 'i3::blocks':
    user    => 'tsharpe',
    config  => 'puppet:///modules/dotfiles/config/i3blocks/config',
    require => Class['profile::fonts'],
  }
}
