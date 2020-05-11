require 'puppet/provider/package'
require 'puppet/provider/package/pacman'

Puppet::Type.type(:package).provide(:packer, :parent => :pacman, :source => :pacman) do
  commands :pacman => File.join(Facter.value(:dotfiles_homedir), '.bin', 'packer')

  defaultfor :operatingsystem => :archlinux
end
