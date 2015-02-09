if !has("gui_running")
    finish
endif

command MaximizedToggle call MaximizedToggle()

function MaximizedToggle()
    if exists("s:maximized")
        simalt ~r
        unlet s:maximized
        let g:screen_size_restore_pos = 1
        call ScreenRestore()
    else
        simalt ~x
        let s:maximized = 1
        let g:screen_size_restore_pos = 0
    endif
endfunction

