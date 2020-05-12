function repo() {
    user=$(echo "${1}" | cut -d '/' -f 1)
    repo=$(echo "${1}" | cut -d '/' -f 2)

    repo_path="${HOME}/code/${user}/${repo}"
    echo "${repo_path}"
    mkdir -p "$(dirname "${repo_path}")"

    if [ ! -d "${repo_path}" ]; then
        git clone "https://github.com/${user}/${repo}" "${repo_path}"
    fi

    cd "${repo_path}" || return
}
