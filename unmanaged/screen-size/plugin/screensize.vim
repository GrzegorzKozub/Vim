if !has("gui_running")
    finish
endif

if !exists("g:screen_size_restore_pos")
    let g:screen_size_restore_pos = 1
endif

if !exists("g:screen_size_by_vim_instance")
    let g:screen_size_by_vim_instance = 1
endif

autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif

function! ScreenRestore()
    let f = s:GetScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
        let vim_instance = (g:screen_size_by_vim_instance == 1 ? (v:servername) : "GVIM")
        for line in readfile(f)
            let sizepos = split(line)
            if len(sizepos) == 5 && sizepos[0] == vim_instance
                silent! execute "set columns=" . sizepos[1] . " lines=" . sizepos[2]
                silent! execute "winpos " . sizepos[3] . " " . sizepos[4]
                return
            endif
        endfor
    endif
endfunction

function! ScreenSave()
    if has("gui_running") && g:screen_size_restore_pos
        let vim_instance = (g:screen_size_by_vim_instance == 1 ? (v:servername) : "GVIM")
        let data = vim_instance . " " . &columns . " " . &lines . " " .
            \ (getwinposx() < 0 ? 0 : getwinposx()) . " " .
            \ (getwinposy() < 0 ? 0 : getwinposy())
        let f = s:GetScreenFilename()
        if filereadable(f)
            let lines = readfile(f)
            call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
            call add(lines, data)
        else
            let lines = [data]
        endif
        call writefile(lines, f)
    endif
endfunction

function! s:GetScreenFilename()
    if !exists("g:screen_size_dir")
        let g:screen_size_dir = $HOME
    endif
    if !exists("g:screen_size_file")
        let g:screen_size_file = ".screensize"
    endif
    return g:screen_size_dir . "/" . g:screen_size_file
endfunction

