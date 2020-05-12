function check_for_updates() {
    for fn in "${update_functions[@]}"; do
        ($fn)
    done
}
