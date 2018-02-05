class neovim(
  $user,
  $vimrc,
  $plugins = nil,
) {
  $vim_config_dir = "home/${user}/.config/nvim"

  package { 'neovim': }

  file { $vim_config_dir:
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755',
  }

  if $plugins {
    file { "${vim_config_dir}/autoload":
      ensure => directory,
      owner  => $user,
      group  => $user,
      mode   => '0755',
    }

    $vim_plug_path = "${vim_config_dir}/autoload/plug.vim"
    $vim_plug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    exec { 'neovim/install_vim-plug':
      command => "/usr/bin/curl -fLo ${vim_plug_path} ${vim_plug_url}",
      user    => $user,
      group   => $user,
      creates => $vim_plug_path,
      require => File["${vim_config_dir}}/autoload"],
    }

    file { "${vim_config_dir}/plugins.vim":
      ensure => file,
      owner  => $user,
      group  => $user,
      source => $plugins,
      notify => Exec['neovim/install_plugins'],
    }

    exec { 'neovim/install_plugins':
      command     => '/usr/bin/nvim +PlugInstall +qall',
      user        => $user,
      refreshonly => true,
      require     => [
        File["${vim_config_dir}/init.vim"],
        Exec['neovim/install_vim-plug'],
        Package['neovim'],
      ],
    }
  }

  file { "${vim_config_dir}/init.vim":
    ensure => file,
    owner  => $user,
    group  => $user,
    source => $vimrc,
  }
}
