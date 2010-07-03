function is_svn_repo {
    [[ -d .svn ]] && echo "1" && return
    echo "0"
}

function get_revision_number {
    svn info | grep Revision | awk '{print $2}'
}

chpwd_functions+='zsh_chpwd_update_svn_vars'
function zsh_chpwd_update_svn_vars {
    export __IS_SVN_REPO="$(is_svn_repo)"
}

precmd_functions+='zsh_preexec_update_svn_vars'
function zsh_preexec_update_svn_vars {
    if [[ $__IS_SVN_REPO -eq 1 ]]; then
        export __SVN_REV="$(get_revision_number)"
    fi
}

export __IS_SVN_REPO="$(is_svn_repo)"
export __SVN_REV=""
