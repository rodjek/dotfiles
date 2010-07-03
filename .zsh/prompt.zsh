function git_prompt_info() {
    if [[ $__SHOW_GIT_INFO -eq 1 ]]; then
        echo "git:($__CURRENT_GIT_BRANCH)$__CURRENT_GIT_DIRTY"
    fi
}

PROMPT='%m :: %2~ $(git_prompt_info)%B»%b '
