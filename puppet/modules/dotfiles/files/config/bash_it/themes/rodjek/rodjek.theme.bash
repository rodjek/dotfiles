SCM_THEME_PROMPT_PREFIX=":"
SCM_THEME_PROMPT_SUFFIX=""
SCM_THEME_PROMPT_DIRTY="!"
SCM_THEME_PROMPT_CLEAN=""
SCM_GIT_CHAR="git"
SCM_SVN_CHAR="svn"
SCM_HG_CHAR="hg"

scm_prompt() {
    CHAR=$(scm_char)
    if [ $CHAR = $SCM_NONE_CHAR ]; then
        return
    else
        echo "($CHAR$(scm_prompt_info))"
    fi
}

dir_and_parent() {
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

rodjek_prompt() {
    case $(id -u) in
        0)
            ps_user_mark="${red}# ${normal}"
            ;;
        *)
            ps_user_mark="${green}$ ${normal}"
            ;;
    esac

    PS1="\h :${blue}$?${normal}: $(dir_and_parent) $(scm_prompt)${ps_user_mark}"
}

safe_append_prompt_command rodjek_prompt
