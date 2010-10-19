function git_prompt_info() {
    if [[ $__SHOW_GIT_INFO -eq 1 ]]; then
        echo "git:($__CURRENT_GIT_BRANCH)$__CURRENT_GIT_DIRTY"
    fi
}

function svn_prompt_info() {
    if [[ $__IS_SVN_REPO -eq 1 ]]; then
        echo "svn:(r$__SVN_REV)"
    fi
}

function is_root() {
    if [ $(id -u) -eq 0 ]; then
        echo '\e[0;31m%B»%b\e[0m'
    else
        echo '%B»%b'
    fi
}

PROMPT='%m :%?: %2~ $(git_prompt_info)$(svn_prompt_info)$(is_root) '
