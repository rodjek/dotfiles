class dotfiles(
  Array[String[1]] $packages = [],
  String[1] $base_dir = $facts['dotfiles_base_dir'],
) {
  $config = dotfiles::load_yaml(dotfiles::filesystem_join($base_dir, 'dotfile-config.yaml'))

  $config.dig('dotfiles', 'symlink').then |$symlinks| {
    $symlinks.each |$symlink| {
      dotfiles::symlink { $symlink[0]:
        params => $symlink[1],
      }
    }
  }

  package { $packages:
    provider => packer,
  }
}
