if !has('win32') || !has('gui_running')
    finish
endif

command! ToggleFullScreen call ToggleFullScreen()

function! ToggleFullScreen()
    call libcallnr($VIMRUNTIME . '/gvimfullscreen.dll', 'ToggleFullScreen', 0)
    if exists('s:full_screen')
        unlet s:full_screen
        let g:screen_memento_active = 1
    else
        let s:full_screen = 1
        let g:screen_memento_active = 0
    endif
    if &diff
        wincmd =
    endif
endfunction

