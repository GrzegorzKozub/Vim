command -bang -nargs=? LocationToggle call LocationToggle(<bang>0)

function LocationToggle(force)
    if exists("s:location_open") && a:force == 0
        lopen
        unlet s:location_open
    else
        lclose
        let s:location_open = bufnr("$")
    endif
endfunction

