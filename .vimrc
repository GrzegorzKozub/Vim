" vim: set foldmarker={,} foldmethod=marker :

" file options {

    scriptencoding "utf-8"

" }
" includes {

    source $VIMRUNTIME/mswin.vim
    runtime macros/matchit.vim

" }
" directories {

    let s:vim_data_dir = expand("~/.vim/")
    let s:vim_backup_dir = s:vim_data_dir . "backup/"
    let s:vim_undo_dir = s:vim_data_dir . "undo/"
    let s:vim_plugin_data_dir = s:vim_data_dir . "plugins/"

    silent! call mkdir(s:vim_backup_dir, "p")
    silent! call mkdir(s:vim_undo_dir, "p")
    silent! call mkdir(s:vim_plugin_data_dir, "p")

" }
" settings {

    set nocompatible

    set autoindent
    set backup
    set belloff=all
    set conceallevel=1
    set concealcursor=nvic
    set encoding=utf-8
    set expandtab
    set fillchars+=vert:\
    set foldlevelstart=99
    set foldmethod=syntax
    set hidden
    set history=128
    set hlsearch
    set ignorecase
    set incsearch
    set lazyredraw
    set nojoinspaces
    set noswapfile
    set nowrap
    set number
    set pastetoggle=<F2>
    set ruler
    set scrolloff=5
    set shiftwidth=4
    set shortmess+=I
    set showcmd
    set showmatch
    set sidescroll=1
    set sidescrolloff=15
    set smartcase
    set smartindent
    set smarttab
    set softtabstop=4
    set spelllang=en_gb,pl
    set tabstop=4
    set undofile
    set wildignore+=*.7z,*.bmp,*.dll,*.exe,*.gif,*.ico,*.icl,*.jpeg,*.jpg,*.ldf,*.png,*.rar,*.sdf,*.sqlite,*.suo,*.zip
    set wildmenu
    set wildmode=list:longest

    let &backupdir = s:vim_backup_dir
    let &undodir = s:vim_undo_dir
    let &viminfo = &viminfo . ",n" . s:vim_data_dir . ".viminfo"

    language English_US
    syntax on

    if has("autocmd")
        filetype plugin indent on
    endif

    if has("gui_running")
        set columns=180
        set cursorline
        set guifont=Consolas\ for\ Powerline\ FixedD:h13:cEASTEUROPE
        set guioptions+=c
        set guioptions-=b
        set guioptions-=r
        set guioptions-=L
        set guioptions-=m
        set guioptions+=M
        set guioptions-=T
        set guitablabel=%t\ %M
        set laststatus=2
        set lines=45
        set linespace=0
        set listchars=tab:→\ ,eol:¬,trail:·
        set noshowmode
        "set renderoptions=type:directx,gamma:1.8,contrast:0.5,level:0.5,geom:1,renmode:5,taamode:1

        winpos 462 208 " 1440p
        "winpos 140 26 " 1080p
    else
        set listchars=tab:»\ ,eol:¬,trail:_
    endif

" }
" plugins {
    " vim-pathogen {

        runtime ./bundle/vim-pathogen/autoload/pathogen.vim
        call pathogen#infect()
        :Helptags

    " }
    " ack.vim {

        if executable("ag")
            let g:ackprg = "ag --vimgrep"
        endif

    " }
    " ctrlp.vim {

        let g:ctrlp_cache_dir = s:vim_plugin_data_dir . "ctrlp.vim"
        nmap <silent> <C-b> :CtrlPBuffer<CR>
        nmap <silent> <C-k> :CtrlPMRUFiles<CR>

    " }
    " emmet-vim {

        let g:user_emmet_install_global = 0
        autocmd FileType html,css EmmetInstall

    " }
    " gruvbox {

        if has("gui_running")
            let g:gruvbox_contrast_dark  = "soft"
            let g:gruvbox_contrast_light = "soft"

            let g:gruvbox_bold = 0
            let g:gruvbox_italic = 0
            let g:gruvbox_undercurl = 0
            let g:gruvbox_underline = 0

            let g:gruvbox_invert_selection = 0
            let g:gruvbox_italicize_comments = 0

            let g:gruvbox_sign_column = "bg0"
            let g:gruvbox_vert_split = "bg0"
        endif

    " }
    " gundo.vim {

        let g:gundo_help = 0
        let g:gundo_prefer_python3 = 0
        let g:gundo_width = 40

        nmap <silent> <Leader>g :GundoToggle<CR>

    " }
    " javascript-libraries-syntax.vim {

        let g:used_javascript_libs = "underscore,angularjs,angularui,angularuirouter,react,requirejs,jasmine,chai"

    " }
    " lightline {

        let g:lightline = {
            \ "active": {
                \ "left": [
                    \ [ "mode", "paste" ],
                    \ [ "fugitive" ],
                    \ [ "filename" ]
                \ ],
                \ "right": [
                    \ [ "syntastic", "trailingwhitespace", "mixedindent", "percent", "lineinfo" ],
                    \ [ "fileencoding", "fileformat" ],
                    \ [ "filetype" ]
                \ ]
            \ },
            \ "inactive" : {
                \ "left": [
                    \ [ "fugitive", "filename" ]
                \ ],
                \ "right": [
                    \ [ ],
                    \ [ "filetype", "fileencoding", "fileformat", "percent", "lineinfo" ]
                \ ]
            \ },
            \ "component_function": {
                \ "fugitive": "LightLineFugitive",
                \ "filename": "LightLineFileName",
                \ "percent": "LightLinePercent",
                \ "lineinfo": "LightLineLineInfo",
                \ "fileencoding": "LightLineFileEncoding",
                \ "fileformat": "LightLineFileFormat",
                \ "filetype": "LightLineFileType"
            \ },
            \ "component_expand": {
                \ "trailingwhitespace": "LightLineTrailingWhitespace",
                \ "mixedindent": "LightLineMixedIndent",
                \ "syntastic": "SyntasticStatuslineFlag"
            \ },
            \ "component_type": {
                \ "trailingwhitespace": "warning",
                \ "mixedindent": "warning",
                \ "syntastic": "error"
            \ },
            \ "colorscheme": "" . strftime("%a") =~ 'Sat\|Sun' ? "gruvbox" : "solarized" . "",
            \ "mode_map": {
                \ "n" : "NORMAL",
                \ "i" : "INSERT",
                \ "R" : "REPLACE",
                \ "v" : "VISUAL",
                \ "V" : "VISUAL LINE",
                \ "\<C-v>": "VISUAL BLOCK",
                \ "c" : "COMMAND",
                \ "s" : "SELECT",
                \ "S" : "SELECT LINE",
                \ "\<C-s>": "SELECT BLOCK",
                \ "t": "TERMINAL"
            \ },
            \ "separator": {
                \ "left": "⮀",
                \ "right": "⮂"
            \ },
            \ "subseparator": {
                \ "left": "⮁",
                \ "right": "⮃"
            \ },
            \ "enable": {
                \ "tabline": 0
            \ },
        \ }

        " component functions {

            function! LightLineFugitive()
                if &ft == "gundo"
                    return "Gundo"
                elseif &ft == "diff"
                    return "Gundo"
                elseif &ft == "vimfiler"
                    return "VimFiler"
                elseif &ft == "help"
                    return "Help"
                elseif &ft == "qf"
                    return exists("w:quickfix_title") ? "Location" : "QuickFix"
                elseif expand("%:t") == "ControlP"
                    return "CtrlP"
                endif
                if exists("*fugitive#head")
                    let l:branch = fugitive#head()
                    return l:branch !=# "" ? "⭠ ".l:branch : ""
                endif
                return ""
            endfunction

            function! LightLineFileName()
                if &ft == "gundo"
                    return "Log"
                elseif &ft == "diff"
                    return "Diff"
                elseif &ft == "vimfiler"
                    return substitute(vimfiler#get_status_string(), '\*safe\*', "♥", "")
                elseif &ft == "qf"
                    return ""
                elseif expand("%:t") == "ControlP" && has_key(g:lightline, "ctrlp_item")
                    if g:lightline.ctrlp_item == "files"
                        return "Files"
                    elseif g:lightline.ctrlp_item == "mru files"
                        return "Recent"
                    endif
                    return "Buffers"
                endif
                let l:filename = expand("%:t") == "" ? "[No Name]" : expand("%:t")
                if &ft == "help"
                    return l:filename
                endif
                return l:filename . (&readonly ? " ⭤" : "") . (&modified ? " ✘" : " ✔")
            endfunction

            function! LightLineWarning(regex, type)
                if &ft =~ 'diff\|gundo\|help\|qf\|vimfiler'
                    return ""
                endif
                let l:line = search(a:regex, "nw")
                return l:line != 0 ? printf("%s at %d", a:type, l:line) : ""
            endfunction

            function! LightLineTrailingWhitespace()
                return LightLineWarning('\s$', "trailing")
            endfunction

            function! LightLineMixedIndent()
                return LightLineWarning('\v(^\t+ +)|(^ +\t+)', "mixed")
            endfunction

            function! LightLinePercent()
                return &ft !~? 'diff\|gundo' ? printf("%3d%%", (100 * line(".") / line("$"))) : ""
            endfunction

            function! LightLineLineInfo()
                return &ft !~? 'diff\|gundo' ? printf("⭡ %3d ₠ %3d", line("."), col(".")) : ""
            endfunction

            function! LightLineFileEncoding()
                return strlen(&fenc) > 0 && &ft !~? 'diff\|gundo\|help\|qf\|vimfiler' ? &fenc : ""
            endfunction

            function! LightLineFileFormat()
                return strlen(&ff) > 0 && &ft !~? 'diff\|gundo\|help\|qf\|vimfiler' && expand("%:t") != "ControlP" ? &ff : ""
            endfunction

            function! LightLineFileType()
                return strlen(&ft) > 0 && &ft !~? 'diff\|gundo\|help\|qf\|vimfiler' ? printf("⭢⭣ %s", &ft) : ""
            endfunction

        " }
        " ctrlp.vim integration {

            let g:ctrlp_status_func = {
                \ "main": "CtrlPStatusFuncMain",
                \ "prog": "CtrlPStatusFuncProg",
            \ }

            function! CtrlPStatusFuncMain(focus, byfname, regex, prev, item, next, marked)
                let g:lightline.ctrlp_item = a:item
                return lightline#statusline(0)
            endfunction

            function! CtrlPStatusFuncProg(str)
                return lightline#statusline(0)
            endfunction

        " }
        " syntastic integration {

            function! SyntasticCheckHook(errors)
                call lightline#update()
            endfunction

        " }
        " reload on colorscheme change {

            function! s:LightLineReload()
                if !exists("g:loaded_lightline")
                    return
                endif

                "for l:vanila_colorscheme_file in split(globpath($VIM . '\vimfiles\bundle\lightline.vim\autoload\lightline\colorscheme', "*.vim"), "\n")
                    "execute("source ".l:vanila_colorscheme_file)
                "endfor

                for l:customized_colorscheme_file in split(globpath($VIM . '\vimfiles\plugin\lightline\colorscheme', "*.vim"), "\n")
                    execute("source ".l:customized_colorscheme_file)
                endfor

                let g:lightline.colorscheme = g:colors_name
                call lightline#init()
                call lightline#colorscheme()
                call lightline#update()
            endfunction

            augroup ColorSchemeLightLineReload
                autocmd!
                autocmd ColorScheme * call s:LightLineReload()
            augroup END

        " }

    " }
    " netrw {

        let g:netrw_home = s:vim_plugin_data_dir . "netrw"
        let g:netrw_localcopycmd = "copy"

    " }
    " syntastic {

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_stl_format = "error at %F (%t)"

        let g:syntastic_javascript_checkers = ["eslint"]
        let g:syntastic_typescript_checkers = ["tslint"]

        let g:syntastic_error_symbol = "\u00A0●"
        let g:syntastic_style_error_symbol = "\u00A0●"
        let g:syntastic_warning_symbol = "\u00A0▲"
        let g:syntastic_style_warning_symbol = "\u00A0▲"

    " }
    " typescript-vim {

        let g:typescript_compiler_binary = "tsc"
        let g:typescript_compiler_options = ""

    " }
    " vim-autoformat {

        nmap <silent> <Leader>af :Autoformat<CR>

    " }
    " vim-colors-solarized {

        if has("gui_running")
            let g:solarized_bold = 0
            let g:solarized_underline = 0
            let g:solarized_italic = 0

            " https://github.com/altercation/vim-colors-solarized/issues/40
            call togglebg#map("")

            function! BackgroundToggle()
                ToggleBG
            endfunction

            nmap <silent> <F5> :call BackgroundToggle()<CR>
        endif

    " }
    " vim-dispatch {

        nmap <silent> <Leader>m :Make<CR>

    " }
    " vim-easyclip {

        let g:EasyClipUseCutDefaults = 0
        nmap t <plug>MoveMotionPlug
        xmap t <plug>MoveMotionXPlug
        nmap tt <plug>MoveMotionLinePlug

        let g:EasyClipUsePasteToggleDefaults = 0
        nmap <c-n> <plug>EasyClipSwapPasteForward
        nmap <char-238> <plug>EasyClipSwapPasteBackwards " Alt + N

    " }
    " vim-fugitive {

        if has("autocmd")
            " after they're used, automatically delete the buffers created by vim-fugitive
            autocmd BufReadPost fugitive://* set bufhidden=delete
        endif

    " }
    " vim-javascript {

        let g:javascript_plugin_jsdoc = 1
        let g:javascript_plugin_ngdoc = 1

    " }
    " vim-js-pretty-template {

        autocmd FileType javascript,typescript JsPreTmpl markdown
        autocmd FileType typescript syn clear foldBraces

    " }
    " vim-markdown {

        let g:vim_markdown_folding_disabled = 1

    " }
    " vimfilter.vim {

        let g:vimfiler_as_default_explorer = 1
        let g:vimfiler_data_directory = s:vim_plugin_data_dir . "vimfilter.vim"
        let g:vimfiler_force_overwrite_statusline = 0
        let g:vimfiler_ignore_pattern = []

        let g:vimfiler_file_icon = " "
        let g:vimfiler_marked_file_icon = "✔"
        let g:vimfiler_readonly_file_icon = "⭤"
        let g:vimfiler_tree_closed_icon = "▸"
        let g:vimfiler_tree_leaf_icon = " "
        let g:vimfiler_tree_opened_icon = "▾"

        nmap <silent> <Leader>f :VimFiler -toggle<CR>
        autocmd FileType vimfiler nmap <buffer> <Leader>f :VimFiler -toggle<CR>

    " }
    " vimsize.vim {

        let g:vimsize_dir = s:vim_plugin_data_dir

    " }
" }
" color scheme {

    if has("autocmd")

        source $VIM/vimfiles/plugin/hidetildeonemptylines.vim

        augroup ColorSchemeHideTildeOnEmptyLines
            autocmd!
            autocmd ColorScheme * call HideTildeOnEmptyLines()
        augroup END

    endif

    if has("gui_running")
        if strftime("%H") > 6 && strftime("%H") < 18
            set background=light
        else
            set background=dark
        endif

        if strftime("%a") =~ 'Sat\|Sun'
            colorscheme gruvbox
        else
            colorscheme solarized
        endif
    else
        set background=dark
        colorscheme default
    endif

" }
" auto-commands {

    if has("autocmd")

    " file types based on file extensions {

        autocmd BufNewFile,BufRead *.ascx,*.aspx,*.cshtml,*.master set filetype=html
        autocmd BufNewFile,BufRead *.config,*.nuspec set filetype=xml

    " }
    " file type specific settings {

        autocmd FileType vim setlocal textwidth=0

        autocmd FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

        autocmd FileType autohotkey setlocal suffixesadd+=.ahk
        autocmd FileType javascript,ts setlocal suffixesadd+=.js,.json,.ts
        autocmd FileType css,less,sass setlocal suffixesadd+=.css,.less,.sass
        autocmd FileType dosbatch setlocal suffixesadd+=.bat,.cmd
        autocmd FileType html setlocal suffixesadd+=.ascx,.aspx,.cshtml,.css,.js,.json,.less,.sass,.ts
        autocmd FileType perl setlocal suffixesadd+=.pl,.pm
        autocmd FileType ps1 setlocal suffixesadd+=.ps1,.psd1,.psm1
        autocmd FileType python setlocal suffixesadd+=.py
        autocmd FileType ruby setlocal suffixesadd+=.gemspec,.rake,.rb,.rbw,.rdoc
        autocmd FileType vim setlocal suffixesadd+=.vim
        autocmd FileType xml setlocal suffixesadd+=*.config,*.xml
        autocmd FileType xsd setlocal suffixesadd+=*.xsd

        " enable SyntaxComplete if there's no language specific OMNI script
        autocmd Filetype * if (exists("+omnifunc") && &omnifunc == "") | setlocal omnifunc=syntaxcomplete#Complete | endif

    " }
    " compilers {

        autocmd FileType c,cpp compiler gcc
        autocmd FileType cs compiler csc

    " }
    " other {

        " after a file is open, go to the last visited location
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

        " do not overwrite the backup files of the same name
        autocmd BufWritePre * let &backupext = "@" . substitute(expand("%:p:h"), ",\\=[:\\\/]", "%", "g")

        " source .vimrc when it's saved and restore the screen size and position
        autocmd! BufWritePost $MYVIMRC nested source $MYVIMRC | if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif

    " }

    endif

" }
" mappings {

    vmap <Down> j
    vmap <Left> h
    vmap <Right> l
    vmap <Up> k

    cnoremap %% <C-R>=expand('%:h') . '\'<CR>

    command! HlsearchOff nohlsearch
    nmap <silent> <Leader>h :HlsearchOff<CR>

    command! WrapToggle set wrap! linebreak! nolist
    nmap <silent> <Leader>w :WrapToggle<CR>

    command! ListToggle set list!
    nmap <silent> <Leader>t :ListToggle<CR>

    command! SpellToggle set spell!
    nmap <silent> <F7> :SpellToggle<CR>

    nmap <silent> <F10> :MaximizedToggle<CR>
    nmap <silent> <F11> :FullScreenToggle<CR>
    nmap <silent> <F12> :DistractionFreeToggle 17<CR>

    nmap <silent> <Leader>q :QuickfixToggle<CR>
    nmap <silent> <Leader>l :LocationToggle<CR>

    command! -nargs=* DiffGet :diffget <args> | :diffupdate
    nmap <silent> <Leader>d1 :DiffGet 1<CR>
    nmap <silent> <Leader>d2 :DiffGet 2<CR>
    nmap <silent> <Leader>d3 :DiffGet 3<CR>

    command! -nargs=* DiffPut :diffput <args> | :diffupdate
    nmap <silent> <Leader>d4 :DiffPut 4<CR>

" }

