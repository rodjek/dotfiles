define dotfiles::symlink(
  Optional[Variant[String[1], Hash]] $params,
) {

  $path = dotfiles::filesystem_join($facts['dotfiles_homedir'], $title)
  $target = $params ? {
    Undef  => dotfiles::filesystem_join($facts['dotfiles_base_dir'], $title),
    String => dotfiles::filesystem_join($facts['dotfiles_base_dir'], $params),
    Hash   => $params.dig('target')
                .then |$r| { dotfiles::filesystem_join($facts['dotfiles_base_dir'], $r) }
                .lest || { fail("${title} symlink does not specify a target") },
  }

  file { $path:
    ensure => symlink,
    target => $target,
  }
}
