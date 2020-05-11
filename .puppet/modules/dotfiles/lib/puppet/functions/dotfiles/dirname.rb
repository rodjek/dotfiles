Puppet::Functions.create_function(:'dotfiles::dirname') do
  dispatch :dirname do
    param 'String', :path
  end

  def dirname(path)
    File.dirname(path)
  end
end
