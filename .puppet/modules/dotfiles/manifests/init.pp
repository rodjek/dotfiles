class dotfiles(
  String[1]                  $base_dir = $facts['dotfiles_base_dir'],
  Array[String[1]]           $packages = [],
  Hash[String[1], Variant[String[1], Undef, Hash]] $symlinks = {},
) {
  $symlinks.each |$symlink| {
    dotfiles::symlink { $symlink[0]:
      params => $symlink[1],
    }
  }

  package { $packages:
    provider => packer,
  }
}
