command! LocationToggle call LocationToggle()

function! LocationToggle()
    if exists("s:location_open")
        lclose
        unlet s:location_open
    else
        lopen
        let s:location_open = bufnr("$")
    endif
endfunction

