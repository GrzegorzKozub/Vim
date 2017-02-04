command! -bang -nargs=? ToggleQuickfix call ToggleQuickfix(<bang>0)

function! ToggleQuickfix(force)
    if exists('s:quickfix_open') && a:force == 0
        cclose
        unlet s:quickfix_open
    else
        copen
        let s:quickfix_open = bufnr('$')
    endif
endfunction

