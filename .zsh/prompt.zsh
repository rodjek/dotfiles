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

PROMPT='%m :: %2~ $(git_prompt_info)$(svn_prompt_info)%B»%b '
