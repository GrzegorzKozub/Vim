if !has("gui_running")
    finish
endif

command -nargs=* DistractionFreeToggle call DistractionFreeToggle(<f-args>)

function DistractionFreeToggle(font_size)
    if exists("s:distraction_free")
        call RestoreOriginalSettings()
        unlet s:distraction_free
    else
        call SaveOriginalSettings()
        call ApplyDistractionFreeSettings(a:font_size)
        let s:distraction_free = 1
    endif
    call FullScreenToggle()
endfunction

function SaveOriginalSettings()
    let s:original_background = &background
    let s:original_guifont = &guifont
    let s:original_laststatus = &laststatus
    let s:original_lines = &lines
    let s:original_linespace = &linespace
    let s:original_number = &number
    let s:original_ruler = &ruler
endfunction

function RestoreOriginalSettings()
    exec "set background=" . s:original_background | unlet s:original_background
    exec "set guifont=" . escape(s:original_guifont, " ") | unlet s:original_guifont
    exec "set laststatus=" . s:original_laststatus | unlet s:original_laststatus
    exec "set lines=" . s:original_lines | unlet s:original_lines
    exec "set linespace=" . s:original_linespace | unlet s:original_linespace
    exec s:original_number == 1 ? "set number" : "set nonumber" | unlet s:original_number
    exec s:original_ruler == 1 ? "set ruler" : "set noruler" | unlet s:original_ruler
    call DestroyMarginWindows()
endfunction

function ApplyDistractionFreeSettings(font_size)
    wincmd o
    exec "set guifont=" . escape(substitute(s:original_guifont, ",\\=:h[0-9][0-9]:", ":h" . a:font_size . ":", ""), " ")
    set linespace=3
    set laststatus=0
    set nonumber
    set noruler
    call CreateMarginWindows()
endfunction

function CreateMarginWindows()
    let l:vertical_margin_width = &columns / 10
    execute("silent leftabove " . l:vertical_margin_width . "vsplit new")
    call ConcealWindow()
    wincmd l
    execute("silent rightbelow " . l:vertical_margin_width . "vsplit new") 
    call ConcealWindow()
    wincmd h
endfunction

function DestroyMarginWindows()
    wincmd o
endfunction

function ConcealWindow()
    setlocal nonumber
    setlocal nocursorline
    setlocal nomodifiable
    setlocal norelativenumber 
    highlight NonText guifg=bg guibg=bg gui=none
endfunction

