include xorg
include lightdm
include i3

class { 'arch::timezone':
  zone_name => 'Australia/Melbourne',
}

class { 'arch::vconsole':
  keymap => 'dvorak',
}

class { 'arch::locale':
  lang => 'en_AU.UTF-8',
}

class { 'neovim':
  user    => 'tsharpe',
  vimrc   => 'puppet:///modules/dotfiles/config/nvim/init.vim',
  plugins => 'puppet:///modules/dotfiles/config/nvim/plugins.vim',
}
