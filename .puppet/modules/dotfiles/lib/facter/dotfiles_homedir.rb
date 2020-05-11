Facter.add(:dotfiles_homedir) do
  setcode do
    require 'etc'
    Etc.getpwnam(Facter.value(:id)).dir.chomp(File::SEPARATOR)
  end
end
