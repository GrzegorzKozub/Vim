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
    autocmd VimEnter * if g:screen_memento_active == 1 | call ScreenMementoRestore() | endif
    autocmd VimLeavePre * if g:screen_memento_active == 1 | call ScreenMementoSave() | endif
augroup END

function! ScreenMementoRestore()
    let l:file = s:GetFilePath()
    if has('gui_running') && g:screen_memento_active && filereadable(l:file)
        let l:instance = s:GetInstanceName()
        for l:line in readfile(l:file)
            let l:sizepos = split(l:line)
            if len(l:sizepos) == 5 && l:sizepos[0] == l:instance
                silent! execute 'set columns=' . l:sizepos[1] . ' lines=' . l:sizepos[2]
                silent! execute 'winpos ' . l:sizepos[3] . ' ' . l:sizepos[4]
                return
            endif
        endfor
    endif
endfunction

function! ScreenMementoSave()
    if has('gui_running') && g:screen_memento_active
        let l:instance = s:GetInstanceName()
        let l:data = l:instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx() < 0 ? 0 : getwinposx()) . ' ' .
            \ (getwinposy() < 0 ? 0 : getwinposy())
        let l:file = s:GetFilePath()
        if filereadable(l:file)
            let l:lines = readfile(l:file)
            call filter(l:lines, "v:val !~ '^" . l:instance . "\\>'")
            call add(l:lines, l:data)
        else
            let l:lines = [l:data]
        endif
        call writefile(l:lines, l:file)
    endif
endfunction

function! s:GetInstanceName()
    return (g:screen_memento_by_instance == 1 ? (v:servername) : 'GVIM')
endfunction

function! s:GetFilePath()
    if !exists('g:screen_memento_dir')
        let g:screen_memento_dir = $HOME
    endif
    if !exists('g:screen_memento_file')
        let g:screen_memento_file = '.screenmemento'
    endif
    return g:screen_memento_dir . '/' . g:screen_memento_file
endfunction

