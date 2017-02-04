command! VimMerge call VimMerge()

function! VimMerge()
    let s:ft = &ft
    windo if (winnr() != 1 && &ft == '') | :silent! exe 'set ft=' . s:ft | endif
    wincmd b
    wincmd J
    if search('') > 0 | :e ++fileformat=dos | endif
    diffupdate
endfunction

