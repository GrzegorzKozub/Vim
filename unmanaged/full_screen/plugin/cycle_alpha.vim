if !has('win32') || !has('gui_running')
    finish
endif

command! CycleAlpha call CycleAlpha()

function! CycleAlpha()
    let l:all = [255, 224, 192, 160, 128, 96, 64, 32]
    let l:current = exists('g:alpha') ? index(l:all, g:alpha) : 0
    let g:alpha = l:current == len(l:all) - 1 ? l:all[0] : l:all[l:current + 1]
    call libcallnr($VIMRUNTIME . '/gvimfullscreen.dll', 'SetAlpha', g:alpha)
endfunction

