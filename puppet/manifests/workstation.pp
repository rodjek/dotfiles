include profile::archlinux
include profile::i3
include profile::neovim
include profile::urxvt
include profile::mail
include profile::ruby
include avahi

include spotify
include sbcl
include git

class { 'bash_it':
  user => 'tsharpe',
}
arch::aur { 'hipchat': }
package { 'pass': }
