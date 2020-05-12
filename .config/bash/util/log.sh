function log_task_start() {
    local message="${1}"

    echo -ne "${echo_bold_blue}--> ${echo_normal}${message}... "
}

# Optional parameter
# shellcheck disable=SC2120
function log_task_success() {
    if [ -z "${1}" ]; then
        local message="Done"
    else
        local message="${1}"
    fi

    echo -e "${echo_bold_green}${message}${echo_normal}"
}

# Optional parameter
# shellcheck disable=SC2120
function log_task_error() {
    if [ -z "${1}" ]; then
        local message="Failed"
    else
        local message="${1}"
    fi

    echo -e "${echo_bold_red}${message}${echo_normal}"
}
