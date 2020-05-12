prompt() {
    local retval=$?
    local prompt_ret
    local prompt_sign
    local prompt_git
    local prompt_host

    if [[ $retval -eq 0 ]]; then
        prompt_ret="${blue}"
    else
        prompt_ret="${red}"
    fi
    prompt_ret+="${retval}${reset_colour}"

    if [[ "$(id -u)" -eq 0 ]]; then
        prompt_sign="${red}#"
    else
        prompt_sign="${green}$"
    fi
    prompt_sign+="${reset_colour} "

    if [[ -n $SSH_CLIENT || -n $SSH_CONNECTION ]]; then
        prompt_host='\h:'
    fi

    if gitstatus_query; then
        if [[ "${VCS_STATUS_RESULT}" == "ok-sync" ]]; then
            if [[ -n "${VCS_STATUS_LOCAL_BRANCH}" ]]; then
                prompt_git+="(git:${VCS_STATUS_LOCAL_BRANCH/\\/\\\\}"
            else
                prompt_git+="(git:@${VCS_STATUS_COMMIT/\\/\\\\}"
            fi
            prompt_git+=")"
        fi
    fi

    #PS1="${prompt_host}${prompt_ret}: $(__dir_and_parent) ${prompt_git}${prompt_sign}"
    PS1="${yellow}\w ${prompt_git}${reset_colour}\n${prompt_host}${prompt_ret}: ${prompt_sign}"
}

__dir_and_parent() {
    parent=$(basename "$(dirname "$PWD")")
    child=$(basename "$PWD")

    if [ "$PWD" = "$HOME" ]; then
        echo "~"
    else
        if [ "$parent" != "/" ]; then
            if [ "$(readlink -f ..)" = "$HOME" ]; then
                echo -n "~"
            else
                echo -n "$parent"
            fi
        fi
        if [ "$child" != "/" ]; then
            echo -n "/"
        fi
        echo "$child"
    fi
}

gitstatus_stop && gitstatus_start

PS2='> '
PS3='? '
PS4='+<$?> ${BASH_SOURCE:-$BASH}:${FUNCNAME[0]}:$LINENO:'
PROMPT_COMMAND=prompt
