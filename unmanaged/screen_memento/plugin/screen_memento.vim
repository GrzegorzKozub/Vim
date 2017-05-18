scriptencoding 'utf-8'

if !has('gui_running')
    finish
endif

if !exists('g:screen_memento_active')
    let g:screen_memento_active = 1
endif

if !exists('g:screen_memento_by_instance')
    let g:screen_memento_by_instance = 1
endif

augroup SetupScreenMemento
    autocmd!
    if g:screen_memento_active
        autocmd VimEnter * call ScreenMementoRestore()
        autocmd VimLeavePre * call ScreenMementoSave()
    endif
augroup END

function! ScreenMementoRestore()
    let l:instance = s:GetInstanceName()
    if !exists('g:SCREEN_MEMENTO') || !exists('g:SCREEN_MEMENTO["' . l:instance . '"]')
        return
    endif
    let l:memento = g:SCREEN_MEMENTO[l:instance]
    silent! execute 'set columns=' . l:memento[0] . ' lines=' . l:memento[1]
    silent! execute 'winpos ' . l:memento[2] . ' ' . l:memento[3]
endfunction

function! ScreenMementoSave()
    if !exists('g:SCREEN_MEMENTO')
        let g:SCREEN_MEMENTO = {}
    endif
    let g:SCREEN_MEMENTO[s:GetInstanceName()] = [ 
        \ &columns, 
        \ &lines, 
        \ (getwinposx() < 0 ? 0 : getwinposx()),
        \ (getwinposy() < 0 ? 0 : getwinposy()) ]
endfunction

function! s:GetInstanceName()
    return (g:screen_memento_by_instance == 1 ? (v:servername) : 'GVIM')
endfunction

