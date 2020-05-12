function! openscad#DBusSendAction(action)
    let cmd = join([
        \ "silent !", g:dbus_send_command, "--session",
        \ "--dest=org.openscad.OpenSCAD",
        \ "--type=method_call",
        \ "/org/openscad/OpenSCAD/Application",
        \ "org.openscad.OpenSCAD.action", "string:'" . a:action . "'"])
    execute cmd
endfunction

function! openscad#Render()
    call openscad#DBusSendAction("designActionRender")
endfunction
