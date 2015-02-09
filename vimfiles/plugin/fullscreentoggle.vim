if !has("gui_running")
    finish
endif

command FullScreenToggle call FullScreenToggle()

function FullScreenToggle()
    call libcallnr($VIMRUNTIME . "/gvimfullscreen.dll", "ToggleFullScreen", 0)
    if exists("s:full_screen")
        set guioptions+=m
        unlet s:full_screen
        let g:screen_size_restore_pos = 1
        call ScreenRestore()
    else
        set guioptions-=m
        let s:full_screen = 1
        let g:screen_size_restore_pos = 0
    endif
endfunction

