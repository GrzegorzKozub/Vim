" vim: set foldlevel=2 foldmarker={,} foldmethod=marker :

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

    let s:day = strftime("%H") > 6 && strftime("%H") < 18

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
        set background=dark
        set listchars=tab:»\ ,eol:¬,trail:_

        colorscheme grzegorz
    endif

" }
" plugins {
    " vim-pathogen {

        runtime ./bundle/vim-pathogen/autoload/pathogen.vim
        call pathogen#infect()
        :Helptags

    " }
    " ctrlp.vim {

        let g:ctrlp_cache_dir = s:vim_plugin_data_dir . "ctrlp.vim"
        nmap <silent> <C-b> :CtrlPBuffer<CR>
        nmap <silent> <C-k> :CtrlPMRUFiles<CR>

    " }
    " ack.vim {

        if executable("ag")
            let g:ackprg = "ag --vimgrep"
        endif

    " }
    " vim-autoformat {

        nmap <silent> <Leader>af :Autoformat<CR>

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
    " gundo.vim {

        let g:gundo_prefer_python3 = 0
        nmap <silent> <Leader>g :GundoToggle<CR>

    " }
    " gruvbox {

        let g:gruvbox_bold = 0
        let g:gruvbox_italic = 0
        let g:gruvbox_undercurl = 0
        let g:gruvbox_underline = 0

        let g:gruvbox_invert_selection = 0
        let g:gruvbox_italicize_comments = 0

        let g:gruvbox_sign_column = "dark0"

    " }
    " javascript-libraries-syntax.vim {

        let g:used_javascript_libs = "underscore,angularjs,angularui,requirejs,jasmine,chai"

    " }
    " vim-js-pretty-template {

        autocmd FileType javascript,typescript JsPreTmpl markdown
        autocmd FileType typescript syn clear foldBraces

    " }
    " nerdtree {

        let g:NERDTreeChDirMode = 2
        let g:NERDTreeDirArrowExpandable = "▸"
        let g:NERDTreeDirArrowCollapsible = "▾"
        let g:NERDTreeHijackNetrw = 0
        let g:NERDTreeIgnore = ['\cntuser*', '\~$']
        let g:NERDTreeMinimalUI = 1
        let g:NERDTreeWinSize = 40

        nmap <silent> <Leader>nt :NERDTreeToggle<CR>

        if has("autocmd")
            " exit if the only remaining buffer is NERDTree
            autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
        endif

    " }
    " netrw {

        let g:netrw_home = s:vim_plugin_data_dir . "netrw"
        let g:netrw_localcopycmd = "copy"

    " }
    " smartpairs.vim {

        let g:smartpairs_revert_key = "<c-W>"

    " }
    " vim-snipmate {

        imap <c-s> <esc>a<plug>snipMateNextOrTrigger
        smap <c-s> <plug>snipMateNextOrTrigger
        vmap <c-s> <plug>snipMateVisual

        imap <Leader>sm <esc>a<plug>snipMateShow

    " }
    " tagbar {

        let g:tagbar_type_javascript = {
            \ "kinds" : [
                \ "f:functions",
                \ "o:objects",
                \ "a:arrays",
                \ "s:strings",
                \ "n:numbers",
                \ "b:boleans",
                \ "v:variables",
            \ ],
        \ }

        nmap <silent> <Leader>tb :TagbarToggle<CR>

    " }
    " typescript-vim {

        let g:typescript_compiler_binary = "tsc"
        let g:typescript_compiler_options = ""

    " }
    " undotree {

        nmap <silent> <Leader>ut :UndotreeToggle<CR>

    " }
    " ultisnips {

        let g:UltiSnipsExpandTrigger = "<c-e>"
        let g:UltiSnipsJumpForwardTrigger = "<c-d>"
        let g:UltiSnipsJumpBackwardTrigger = "<c-w>"

    " }
    " vim-colors-solarized {

        if has("gui_running")

            if s:day
                set background=light
            else
                set background=dark
            endif

            let g:solarized_bold = 0
            let g:solarized_underline = 0
            let g:solarized_italic = 0

            colorscheme solarized

            " https://github.com/altercation/vim-colors-solarized/issues/40
            call togglebg#map("")

            function! HideTildeOnEmptyLines()
                highlight NonText guifg=BG
                highlight EndOfBuffer guifg=BG
            endfunction

            call HideTildeOnEmptyLines()

            function! BackgroundToggle()
                set nolist
                ToggleBG
                AirlineRefresh
                call HideTildeOnEmptyLines()
                call SetBetterWhitespaceColors()
            endfunction

            nmap <silent> <F5> :call BackgroundToggle()<CR>
        endif

    " }
    " vim-better-whitespace {

        function! SetBetterWhitespaceColors()
            highlight ExtraWhitespace ctermbg=Red guibg=#cb4b16
        endfunction

        call SetBetterWhitespaceColors()

        let g:better_whitespace_enabled = 0
        nmap <silent> <Leader>wt :ToggleWhitespace<CR>
        nmap <silent> <Leader>ws :StripWhitespace<CR>

    " }
    " syntastic {

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_stl_format = "syntax error at %F (%t)"
        let g:syntastic_javascript_checkers = ["eslint"]
        let g:syntastic_typescript_checkers = ["tslint"]

    " }
    " vim-airline {

        if has("gui_running")
            let g:airline_inactive_collapse = 1

            if !exists("g:airline_symbols")
                let g:airline_symbols = {}
            endif

            let g:airline_symbols.branch = "⭠"
            let g:airline_symbols.linenr = "⭡"
            let g:airline_symbols.readonly = "⭤"
            let g:airline_symbols.whitespace = "✶"

            let g:airline_left_sep = "⮀"
            let g:airline_left_alt_sep = "⮁"
            let g:airline_right_sep = "⮂"
            let g:airline_right_alt_sep = "⮃"

            let g:airline_mode_map = {
                \ "__" : "      ",
                \ "n" : "NORMAL",
                \ "i" : "INSERT",
                \ "R" : "REPLACE",
                \ "v" : "VISUAL",
                \ "V" : "VISUAL LINE",
                \ "c" : "COMMAND",
                \ "" : "VISUAL BLOCK",
                \ "s" : "SELECT",
                \ "S" : "SELECT LINE",
                \ "" : "SELECT BLOCK"
            \ }

            let g:airline#extensions#ctrlp#color_template = "normal"
            let g:airline#extensions#hunks#non_zero_only = 1

            let g:airline#extensions#tabline#enabled = 0
            let g:airline#extensions#tabline#show_buffers = 1
            let g:airline#extensions#tabline#show_tab_nr = 0
            let g:airline#extensions#tabline#fnamemod = ":t"

            let g:airline#extensions#tabline#left_sep = "⮀"
            let g:airline#extensions#tabline#left_alt_sep = "⮁"
            let g:airline#extensions#tabline#right_sep = "⮂"
            let g:airline#extensions#tabline#right_alt_sep = "⮃"

            let g:airline#extensions#whitespace#trailing_format = "trailing at %s"
            let g:airline#extensions#whitespace#mixed_indent_format = "mixed indent at %s"

            call airline#parts#define_accent("readonly", "none")
            let g:airline_theme_patch_func = "AirlineThemePatch"

            call airline#parts#define_function("fileencodingandformat", "GetFileEncodingAndFormat")
            let g:airline_section_y = airline#section#create_right(["fileencodingandformat"])
        endif

    " }
    " vim-fugitive {

        if has("autocmd")
            " after they're used, automatically delete the buffers fugitive creates
            autocmd BufReadPost fugitive://* set bufhidden=delete
        endif

    " }
    " vim-markdown {

        let g:vim_markdown_folding_disabled = 1

    " }
    " vim-open-url {

        let g:open_url_browser = "start"

    " }
    " neocomplete.vim {

        set completeopt-=preview

        let g:neocomplete#enable_at_startup = 0

        inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " }
    " vim-nodejs-complete {

        if has("autocmd")
            " automatically open and close the popup menu/preview window
            autocmd CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif
        endif

    " }
    " vimpanel {

        let g:VimpanelStorage = s:vim_plugin_data_dir . "vimpanel"

    " }
    " vimsize.vim {

        let g:vimsize_dir = s:vim_plugin_data_dir

    " }
" }
" auto-commands {

    if has("autocmd")

    " file types based on file extensions {

        autocmd BufNewFile,BufRead *.ascx,*.aspx,*.cshtml,*.master set filetype=html
        autocmd BufNewFile,BufRead *.bar set filetype=dosini
        autocmd BufNewFile,BufRead *.config,*.nuspec,*.vssettings set filetype=xml
        autocmd BufNewFile,BufRead *.todo set filetype=taskpaper

    " }
    " file type specific settings {

        autocmd FileType vim setlocal textwidth=0

        autocmd FileType taskpaper setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
        autocmd FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

        autocmd FileType autohotkey setlocal suffixesadd+=.ahk
        autocmd FileType javascript,ts setlocal suffixesadd+=.js,.json,.ts
        autocmd FileType css,less,sass setlocal suffixesadd+=.css,.less,.sass
        autocmd FileType dosbatch setlocal suffixesadd+=.bat,.cmd
        autocmd FileType erb,haml,html setlocal suffixesadd+=.ascx,.aspx,.cshtml,.css,.erb,.haml,.js,.json,.less,.sass,.ts
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
    " automation {

        " after a file is open, go to the last visited location
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

        " do not overwrite the backup files of the same name
        autocmd BufWritePre * let &backupext = "@" . substitute(expand("%:p:h"), ",\\=[:\\\/]", "%", "g")

        " source the config files when they get saved and restore the screen size and position
        autocmd! BufWritePost .vimrc source $MYVIMRC | if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif | exe "AirlineRefresh"

    " }

    endif

" }
" commands and mappings {

    vmap <Down> j
    vmap <Left> h
    vmap <Right> l
    vmap <Up> k

    cnoremap %% <C-R>=expand('%:h') . '\'<CR>

    " display {

        command! HlsearchOff nohlsearch
        nmap <silent> <Leader>h :HlsearchOff<CR>

        command! WrapToggle set wrap! linebreak! nolist
        nmap <silent> <Leader>w :WrapToggle<CR>

        nmap <silent> <Leader>t :ListToggle<CR>

    " }
    " windows {

        nmap <silent> <F10> :MaximizedToggle<CR>
        nmap <silent> <F11> :FullScreenToggle<CR>
        nmap <silent> <F12> :DistractionFreeToggle 17<CR>
        nmap <silent> <Leader>q :QuickfixToggle<CR>
        nmap <silent> <Leader>l :LocationToggle<CR>

    " }
    " edit {

        nmap <silent> <Leader>f :Format<CR>

        command! FormatHtml :set filetype=html | :Format
        nmap <silent> <Leader>fh :FormatHtml<CR>

        command! FormatJson :set filetype=javascript | :Format
        nmap <silent> <Leader>fj :FormatJson<CR>

        command! FormatXml :set filetype=xml | :Format
        nmap <silent> <Leader>fx :FormatXml<CR>

        command! RemoveBlankLines :g/^$/d
        command! TrimTrailingWhitepace :%s/\s\+$//e | :nohlsearch

    " }
    " diff {

        command! -nargs=* DiffGet :diffget <args> | :diffupdate
        nmap <silent> <Leader>d1 :DiffGet 1<CR>
        nmap <silent> <Leader>d2 :DiffGet 2<CR>
        nmap <silent> <Leader>d3 :DiffGet 3<CR>

        command! -nargs=* DiffPut :diffput <args> | :diffupdate
        nmap <silent> <Leader>d4 :DiffPut 4<CR>

    " }
    " dev {

        command! Ctags :call system("ctags -R .")
        nmap <silent> <Leader>ct :Ctags<CR>

        command! CtagsRuby :call system("ctagsruby")
        nmap <silent> <Leader>ctr :CtagsRuby<CR>

        command! Make :w | :make | :cw
        nmap <silent> <Leader>m :Make<CR>

        nmap <silent> <Leader>r :Run<CR>

    " }
    " reference {

        command! SpellToggle set spell!
        nmap <silent> <F7> :SpellToggle<CR>

    " }
" }

