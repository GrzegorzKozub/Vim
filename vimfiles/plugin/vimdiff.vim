command VimDiff call VimDiff()

function VimDiff()
    simalt ~x
    let s:ft = &ft
    windo if (winnr() != 1 && &ft == "") | :silent! exe "set ft=" . s:ft | endif
    wincmd =
endfunction

