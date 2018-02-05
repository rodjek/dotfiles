class profile::i3 {
  include xorg
  include lightdm

  class { 'i3':
    user   => 'tsharpe',
    config => 'puppet:///modules/dotfiles/config/i3/config',
  }

  class { 'i3blocks':
    user   => 'tsharpe',
    config => 'puppet:///modules/dotfiles/config/i3blocks/config',
  }
}
