if !exists("g:dbus_send_command")
    let g:dbus_send_command = "dbus-send"
endif

nnoremap <buffer> <leader>or
    \ :call openscad#DBusSendAction("designActionRender")<cr>
nnoremap <buffer> <leader>ove
    \ :call openscad#DBusSendAction("viewActionHideEditor")<cr>
nnoremap <buffer> <leader>ovr
    \ :call openscad#DBusSendAction("viewActionResetView")<cr>
nnoremap <buffer> <leader>ovf
    \ :call openscad#DBusSendAction("viewActionFront")<cr>
