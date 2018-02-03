$(CONFIG_D)/nvim/plugged: $(CONFIG_D)/nvim/autoload/plug.vim $(CONFIG_D)/nvim/plugins.vim
	nvim +PlugInstall +qall
	touch "$(@)"

$(CONFIG_D)/nvim/%.vim:
	$(INSTALL_DATA) "$(CWD)/config/nvim/$(*).vim" "$(@)"

neovim: $(CONFIG_D)/nvim/init.vim $(CONFIG_D)/nvim/plugged

targets += neovim
