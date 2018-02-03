$(CONFIG_D)/i3/config:
	$(INSTALL_DATA) "$(CWD)/config/i3/config" "$(@)"

$(CONFIG_D)/i3blocks/config:
	$(INSTALL_DATA) "$(CWD)/config/i3blocks/config" "$(@)"

i3: $(CONFIG_D)/i3/config $(CONFIG_D)/i3blocks/config

targets += i3
