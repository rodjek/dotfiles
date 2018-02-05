class profile::urxvt {
  include profile::fonts

  class { 'urxvt':
    user       => 'tsharpe',
    xresources => 'puppet:///modules/dotfiles/Xresources',
    require    => Class['profile::fonts'],
  }
}
