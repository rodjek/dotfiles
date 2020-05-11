Puppet::Functions.create_function(:'dotfiles::filesystem_join') do
  dispatch :filesystem_join do
    repeated_param 'String', :path
  end

  def filesystem_join(*path)
    File.join(*path)
  end
end
