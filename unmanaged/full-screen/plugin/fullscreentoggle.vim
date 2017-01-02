if !has("gui_running")
    finish
endif

command! FullScreenToggle call FullScreenToggle()

function! FullScreenToggle()
    call libcallnr($VIMRUNTIME . "/gvimfullscreen.dll", "ToggleFullScreen", 0)
    if exists("s:full_screen")
        unlet s:full_screen
        let g:screen_size_restore_pos = 1
    else
        let s:full_screen = 1
        let g:screen_size_restore_pos = 0
    endif
    if &diff
        wincmd =
    endif
endfunction

