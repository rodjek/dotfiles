source ~/.zsh/opts.zsh

for config_file (~/.zsh/libs/*.zsh) source $config_file
unset config_file

[[ -f ~/.zsh/local.zsh ]] && source ~/.zsh/local.zsh

source ~/.zsh/prompt.zsh
