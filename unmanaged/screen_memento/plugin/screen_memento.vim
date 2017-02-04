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

autocmd VimEnter * if g:screen_memento_active == 1 | call ScreenMementoRestore() | endif
autocmd VimLeavePre * if g:screen_memento_active == 1 | call ScreenMementoSave() | endif

function! ScreenMementoRestore()
    let file = s:GetFilePath()
    if has('gui_running') && g:screen_memento_active && filereadable(file)
        let instance = s:GetInstanceName()
        for line in readfile(file)
            let sizepos = split(line)
            if len(sizepos) == 5 && sizepos[0] == instance
                silent! execute 'set columns=' . sizepos[1] . ' lines=' . sizepos[2]
                silent! execute 'winpos ' . sizepos[3] . ' ' . sizepos[4]
                return
            endif
        endfor
    endif
endfunction

function! ScreenMementoSave()
    if has('gui_running') && g:screen_memento_active
        let instance = s:GetInstanceName()
        let data = instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx() < 0 ? 0 : getwinposx()) . ' ' .
            \ (getwinposy() < 0 ? 0 : getwinposy())
        let file = s:GetFilePath()
        if filereadable(file)
            let lines = readfile(file)
            call filter(lines, "v:val !~ '^" . instance . "\\>'")
            call add(lines, data)
        else
            let lines = [data]
        endif
        call writefile(lines, file)
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

