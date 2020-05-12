_arch_packer_updates() {
    log_task_start "Checking for Arch updates"
    outdated=$(packer -Syu --quickcheck | wc -l)
    if [[ $outdated -ne 0 ]]; then
        log_task_error "${outdated} packages out of date"
    else
        log_task_success "No pending updates"
    fi
}

update_functions+=(_arch_packer_updates)
