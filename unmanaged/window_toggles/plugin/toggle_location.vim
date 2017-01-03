command! ToggleLocation call ToggleLocation()

function! ToggleLocation()
    if exists("s:location_open")
        lclose
        unlet s:location_open
    else
        lopen
        let s:location_open = bufnr("$")
    endif
endfunction

