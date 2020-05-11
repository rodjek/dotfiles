define dotfiles::mkdir_p() {
  unless $title == $facts['dotfiles_homedir'] {
    $parent = dotfiles::dirname($title)

    unless defined(Dotfiles::Mkdir_p[$parent]) {
      dotfiles::mkdir_p { $parent: }
    }

    unless defined(File[$title]) {
      file { $title:
        ensure => directory,
        owner  => $facts['id'],
        group  => $facts['id'],
        mode   => '0755',
      }
    }
  }
}
