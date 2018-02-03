$(HOME)/.Xresources:
	$(INSTALL_DATA) "$(CWD)/Xresources" "$(@)"
	xrdb -load "$(@)"
	xrdb -override "$(@)"

xresources: $(HOME)/.Xresources

targets += xresources
