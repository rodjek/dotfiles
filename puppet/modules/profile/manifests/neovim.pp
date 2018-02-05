class profile::neovim {
  class { 'neovim':
    user    => 'tsharpe',
    vimrc   => 'puppet:///modules/dotfiles/config/nvim/init.vim',
    plugins => 'puppet:///modules/dotfiles/config/nvim/plugins.vim',
  }
}
