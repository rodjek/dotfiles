dotfiles_root=$(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))

workstation: bootstrap
	@bundle check > /dev/null || bundle install --path vendor/gems
	@FACTER_dotfiles_base_dir="$(dotfiles_root)" bundle exec puppet apply --hiera_config "$(dotfiles_root)/.puppet/hiera.yaml" --modulepath "$(dotfiles_root)/.puppet/modules" --execute "include dotfiles" --noop

facts:
	@bundle exec puppet facts --modulepath "$(dotfiles_root)/.puppet/modules"

bootstrap: $(HOME)/.bin/packer
	@pacman --query ruby > /dev/null || sudo pacman --noconfirm --sync ruby
	@pacman --query ruby-bundler > /dev/null || sudo pacman --noconfirm --sync ruby-bundler

$(HOME)/.bin/packer:
	@mkdir --parents "$(HOME)/.bin"
	@ln --symbolic "$(dotfiles_root)/.bin/packer" "$(HOME)/.bin/packer"

.PHONY: bootstrap
