source ~/.zsh/opts.zsh
source ~/.zsh/environment.zsh
source ~/.zsh/aliases.zsh

for config_file (~/.zsh/libs/*.zsh) source $config_file
unset config_file

[[ -f ~/.zsh/local.zsh ]] && source ~/.zsh/local.zsh
[[ -f /opt/boxen/env.sh ]] && source /opt/boxen/env.sh

source ~/.zsh/prompt.zsh
