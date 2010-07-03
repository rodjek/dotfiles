function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function parse_git_dirty () {
    if [[ $((git status 2> /dev/null) | tail -n1) != "nothing to commit (working directory clean)" ]]; then
        echo "!"
    else
        echo ""
    fi
}

function show_git_info {
    git show-ref refs/tags/zsh-normal-prompt > /dev/null 2>&1
    echo $?
}

precmd_functions+='zsh_preexec_update_git_vars'
function zsh_preexec_update_git_vars {
    export __CURRENT_GIT_BRANCH="$(parse_git_branch)"
    export __CURRENT_GIT_DIRTY="$(parse_git_dirty)"
    export __SHOW_GIT_INFO="$(show_git_info)"
}

chpwd_functions+='zsh_chpwd_update_git_vars'
function zsh_chpwd_update_git_vars {
    export __CURRENT_GIT_BRANCH="$(parse_git_branch)"
    export __CURRENT_GIT_DIRTY="$(parse_git_dirty)"
    export __SHOW_GIT_INFO="$(show_git_info)"
}

export __CURRENT_GIT_BRANCH="$(parse_git_branch)"
export __CURRENT_GIT_DIRTY="$(parse_git_dirty)"
export __SHOW_GIT_INFO="$(show_git_info)"
