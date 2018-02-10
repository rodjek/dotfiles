help:
	@echo "To setup a full Arch workstation, run 'make workstation'"

update:
	@git pull

bootstrap: update
	@script/bootstrap

workstation: bootstrap
	@sudo FACTER_ruid=$(USER) puppet/bin/puppet apply --modulepath=puppet/modules puppet/manifests/workstation.pp

PHONY: help update bootstrap workstation
