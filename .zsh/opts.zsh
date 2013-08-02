# Bind Fn-left & Fn-right to home & end
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

autoload colors; colors

typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
setopt PROMPT_SUBST
setopt NO_BEEP
