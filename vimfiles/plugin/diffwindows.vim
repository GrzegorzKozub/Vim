command -nargs=* DiffWindows call DiffWindows(<f-args>)

function DiffWindows(...)
    let l:active_window = winnr()
    let l:cursor_position = getpos(".")
    if a:0 <= 1
        windo :diffthis
    else
        windo :diffoff | set scrollbind | set cursorbind
        for window in a:000
            silent! exe window . "wincmd w"
            diffthis
        endfor
    endif
    diffupdate
    silent! exe l:active_window . "wincmd w"
    call setpos(".", l:cursor_position)
endfunction

