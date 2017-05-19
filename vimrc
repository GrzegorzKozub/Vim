" vim: set foldmarker={,} foldmethod=marker :

" includes {

    runtime defaults.vim
    runtime mswin.vim

" }
" directories {

    if has('win32')
        let s:user_dir = expand('~/vimfiles/')
    else
        let s:user_dir = expand('~/.vim/')
    endif

    let s:temp_dir = s:user_dir . 'temp/'

    let s:backup_dir = s:temp_dir . 'backup/'
    let s:undo_dir = s:temp_dir . 'undo/'
    let s:plugins_dir = s:temp_dir . 'plugins/'

    silent! call mkdir(s:backup_dir, 'p')
    silent! call mkdir(s:undo_dir, 'p')
    silent! call mkdir(s:plugins_dir, 'p')

" }
" vim-plug {

    call plug#begin(s:user_dir . 'plugins')

    let g:unmanaged_dir = s:user_dir . 'unmanaged/'

    Plug g:unmanaged_dir . 'customized_colorschemes'
    Plug g:unmanaged_dir . 'diff_and_merge', { 'on': [ 'VimDiff', 'VimMerge' ] }
    Plug g:unmanaged_dir . 'full_screen', { 'on': [ 'CycleAlpha', 'ToggleFullScreen' ] }
    Plug g:unmanaged_dir . 'screen_memento'
    Plug g:unmanaged_dir . 'window_toggles', { 'on': [ 'ToggleLocation', 'ToggleQuickfix' ] }

    Plug 'altercation/vim-colors-solarized'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'chr4/nginx.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'digitaltoad/vim-pug'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'elzr/vim-json'
    Plug 'groenewege/vim-less'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'itchyny/lightline.vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'mattn/emmet-vim'
    Plug 'mileszs/ack.vim'
    Plug 'moll/vim-node'
    Plug 'morhetz/gruvbox'
    Plug 'mxw/vim-jsx'
    Plug 'nelstrom/vim-visual-star-search'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'plasticboy/vim-markdown'
    Plug 'PProvost/vim-ps1'
    Plug 'Quramy/vim-js-pretty-template'
    Plug 'Raimondi/delimitMate'
    Plug 'rakr/vim-one'
    Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'Shougo/unite.vim', { 'on': 'VimFiler' }
    Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
    Plug 'Shougo/vimproc.vim'
    Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
    Plug 'stephpy/vim-yaml'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-git'
    Plug 'tpope/vim-jdaddy'
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'vim-ruby/vim-ruby'
    Plug 'w0rp/ale'

    call plug#end()

" }
" settings {

    set autoindent
    set autoread
    set backup
    set belloff=all
    set conceallevel=1
    set concealcursor=nvic
    set encoding=utf-8
    set expandtab
    set fillchars+=vert:\  " intentional trailing whitespace
    set foldlevelstart=99
    set foldmethod=syntax
    set hidden
    set hlsearch
    set ignorecase
    set laststatus=2
    set lazyredraw
    set listchars=tab:→\ ,eol:¬,trail:·
    set nojoinspaces
    set noshowmode
    set noswapfile
    set nowrap
    set number
    set shiftwidth=4
    set shortmess+=I
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
    set wildmode=list:longest

    let &backupdir = s:backup_dir
    let &undodir = s:undo_dir
    let &viminfo = &viminfo . ',!,n' . s:temp_dir . 'viminfo'

    try | rviminfo | catch | endtry

    scriptencoding 'utf-8'

    if has('win32')
        language English_US
    else
        language en_US.utf8
    endif

    if has('gui_running')
        set cursorline
        set guioptions+=c
        set guioptions-=b
        set guioptions-=r
        set guioptions-=L
        set guioptions-=m
        set guioptions+=M
        set guioptions-=T
        set guitablabel=%t\ %M
        set linespace=0
    else
        set ttyfast
    endif

" }
" gui {

    if has('gui_running')

        if has('win32')
            "set renderoptions=type:directx,gamma:1.8,contrast:0.5,level:0.5,geom:1,renmode:5,taamode:1
            let s:screen = eval(vimproc#system('screen'))

            if s:screen.height == 1440 && s:screen.dpi == 96

                set guifont=Fira\ Code:h14
                set columns=145
                set lines=42
                winpos 75 320

            elseif s:screen.height == 1440 && s:screen.dpi == 192

                set guifont=Fira\ Code\ Retina:h13
                set columns=116
                set lines=29
                winpos 49 35

            elseif s:screen.height == 1800 && s:screen.dpi == 240

                set guifont=Fira\ Code\ Retina:h13:qANTIALIASED
                set columns=117
                set lines=29
                winpos 63 66

            endif
        else

            set guifont=Fira\ Code\ Medium\ 13
            set columns=113
            set lines=30
            winpos 215 100

        endif
    endif

" }
" icons {

    let s:icons = { 'circle': '●', 'triangle': '▲', 'greater_than': '>', 'star': '*', 'vertical_bar': '│' }

    let s:more_icons = &guifont =~# 'Fira'

    let s:icons.left_filled = s:more_icons ? '' : ''
    let s:icons.right_filled = s:more_icons ? '' : ''
    let s:icons.left_empty = s:more_icons ? '' : s:icons.vertical_bar
    let s:icons.right_empty = s:more_icons ? '' : s:icons.vertical_bar

    let s:icons.branch = s:more_icons ? '' : ''
    let s:icons.padlock = s:more_icons ? '' : ''

    let s:icons.space = s:more_icons ? ' ' : ''

" }
" themes {

    let s:themes = [ 'solarized', 'gruvbox', 'one' ]

    if !exists('g:THEME_INDEX')
        let g:THEME_INDEX = 0

        if has('python3')
python3 << EOF
import vim, random;
vim.command("let g:THEME_INDEX = %s" % random.randint(0, int(vim.eval("len(s:themes)")) - 1));
EOF
        endif
    endif

    function! GetCurrentColorScheme()
        return has('gui_running') ? s:themes[g:THEME_INDEX] : 'terminal'
    endfunction

    function! GetCurrentBackground()
        return !has('gui_running') || (strftime('%H') > 6 && strftime('%H') < 18) ? 'light' : 'dark'
    endfunction

" }
" plugins {
    " ack.vim {

        if executable('rg')
            let g:ackprg = 'rg --vimgrep'
        endif

    " }
    " ALE {

        let g:ale_lint_on_enter = 0

        let g:ale_sign_error = s:icons.circle
        let g:ale_sign_warning = s:icons.triangle

        let g:ale_statusline_format = [ s:icons.circle . ' %d', s:icons.triangle . ' %d', '' ]

    " }
    " ctrlp.vim {

        let g:ctrlp_cache_dir = s:plugins_dir . 'ctrlp.vim'

        nmap <silent> <C-p> :CtrlP<CR>
        nmap <silent> <C-b> :CtrlPBuffer<CR>
        nmap <silent> <C-k> :CtrlPMRUFiles<CR>

    " }
    " emmet-vim {

        let g:user_emmet_install_global = 0

        augroup SetupEmmet
            autocmd!
            autocmd FileType html,css EmmetInstall
        augroup END

    " }
    " gruvbox {

        if has('gui_running')
            let g:gruvbox_contrast_dark  = 'soft'
            let g:gruvbox_contrast_light = 'soft'

            let g:gruvbox_bold = 0
            let g:gruvbox_italic = 0
            let g:gruvbox_underline = 0

            let g:gruvbox_invert_selection = 0
            let g:gruvbox_italicize_comments = 0

            let g:gruvbox_sign_column = 'bg0'
            let g:gruvbox_vert_split = 'bg0'
        endif

    " }
    " lightline {
        " configuration {

            let g:lightline = {
                \ 'active': {
                    \ 'left': [
                        \ [ 'mode', 'paste' ],
                        \ [ 'fugitive' ],
                        \ [ 'filename' ]
                    \ ],
                    \ 'right': [
                        \ [ 'aleerror', 'alewarning', 'percent', 'lineinfo' ],
                        \ [ 'fileencoding', 'fileformat' ],
                        \ [ 'filetype' ]
                    \ ]
                \ },
                \ 'inactive' : {
                    \ 'left': [
                        \ [ 'fugitive', 'filename' ]
                    \ ],
                    \ 'right': [
                        \ [ ],
                        \ [ 'filetype', 'fileencoding', 'fileformat', 'percent', 'lineinfo' ]
                    \ ]
                \ },
                \ 'component_function': {
                    \ 'fugitive': 'LightLineFugitive',
                    \ 'filename': 'LightLineFileName',
                    \ 'percent': 'LightLinePercent',
                    \ 'lineinfo': 'LightLineLineInfo',
                    \ 'fileencoding': 'LightLineFileEncoding',
                    \ 'fileformat': 'LightLineFileFormat',
                    \ 'filetype': 'LightLineFileType'
                \ },
                \ 'component_expand': {
                    \ 'aleerror': 'LightLineAleError',
                    \ 'alewarning': 'LightLineAleWarning'
                \ },
                \ 'component_type': {
                    \ 'aleerror': 'error',
                    \ 'alewarning': 'warning'
                \ },
                \ 'colorscheme': '' . GetCurrentColorScheme() . '',
                \ 'mode_map': {
                    \ 'n' : 'NORMAL',
                    \ 'i' : 'INSERT',
                    \ 'R' : 'REPLACE',
                    \ 'v' : 'VISUAL',
                    \ 'V' : 'VISUAL LINE',
                    \ '\<C-v>': 'VISUAL BLOCK',
                    \ 'c' : 'COMMAND',
                    \ 's' : 'SELECT',
                    \ 'S' : 'SELECT LINE',
                    \ '\<C-s>': 'SELECT BLOCK',
                    \ 't': 'TERMINAL'
                \ },
                \ 'separator': {
                    \ 'left': s:icons.left_filled,
                    \ 'right': s:icons.right_filled
                \ },
                \ 'subseparator': {
                    \ 'left': s:icons.left_empty,
                    \ 'right': s:icons.right_empty
                \ },
                \ 'enable': {
                    \ 'tabline': 0
                \ },
            \ }

        " }
        " component functions {

            function! LightLineFugitive()
                if &filetype ==# 'help'
                    return 'Help'
                elseif &filetype ==# 'Mundo'
                    return 'Mundo'
                elseif &filetype ==# 'MundoDiff'
                    return 'Mundo'
                elseif &filetype ==# 'qf'
                    return exists('w:quickfix_title') ? 'Location' : 'QuickFix'
                elseif &filetype ==# 'vim-plug'
                    return 'Plugins'
                elseif &filetype ==# 'vimfiler'
                    return 'VimFiler'
                elseif expand('%:t') ==# 'ControlP'
                    return 'CtrlP'
                endif
                if exists('*fugitive#head')
                    let l:branch = fugitive#head()
                    if l:branch !=# ''
                        return s:icons.branch . s:icons.space . l:branch
                    endif
                    return ''
                endif
                return ''
            endfunction 

            function! LightLineFileName()
                if &filetype ==# 'Mundo'
                    return 'Tree'
                elseif &filetype ==# 'MundoDiff'
                    return 'Diff'
                elseif &filetype ==# 'qf'
                    return ''
                elseif &filetype ==# 'vim-plug'
                    return ''
                elseif &filetype ==# 'vimfiler'
                    return substitute(vimfiler#get_status_string(), '\*safe\*', s:icons.padlock, '')
                elseif expand('%:t') ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item')
                    if g:lightline.ctrlp_item ==# 'files'
                        return 'Files'
                    elseif g:lightline.ctrlp_item ==# 'mru files'
                        return 'Recent'
                    endif
                    return 'Buffers'
                endif
                let l:filename = expand('%:t') ==# '' ? '[No Name]' : expand('%:t')
                if &filetype ==# 'help'
                    return l:filename
                endif
                return l:filename . (&readonly ? s:icons.space . s:icons.padlock : '') . (&modified ? ' ' . s:icons.star : '')
            endfunction

            function! LightLineAleError()
                return matchstr(ALEGetStatusLine(), s:icons.circle . ' \d\+')
            endfunction

            function! LightLineAleWarning()
                return matchstr(ALEGetStatusLine(), s:icons.triangle . ' \d\+')
            endfunction

            function! LightLinePercent()
                return &filetype !~? 'Mundo\|MundoDiff' ? printf('%3d%%', (100 * line('.') / line('$'))) : ''
            endfunction

            function! LightLineLineInfo()
                return &filetype !~? 'Mundo\|MundoDiff' ? printf('%3d %3d', line('.'), col('.')) : ''
            endfunction

            function! LightLineFileEncoding()
                return strlen(&fileencoding) > 0 && &filetype !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug\|vimfiler' ? &fileencoding : ''
            endfunction

            function! LightLineFileFormat()
                return strlen(&fileformat) > 0 && &filetype !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug\|vimfiler' && expand('%:t') !=# 'ControlP' ? &fileformat : ''
            endfunction

            function! LightLineFileType()
                return strlen(&filetype) > 0 && &filetype !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug\|vimfiler' ? &filetype : ''
            endfunction

        " }
        " ALE integration {

            augroup UpdateLightLineWhenALELints
                autocmd!
                autocmd User ALELint call lightline#update()
            augroup END

        " }
        " ctrlp.vim integration {

            let g:ctrlp_status_func = {
                \ 'main': 'CtrlPStatusFuncMain',
                \ 'prog': 'CtrlPStatusFuncProg',
            \ }

            function! CtrlPStatusFuncMain(focus, byfname, regex, prev, item, next, marked)
                let g:lightline.ctrlp_item = a:item
                return lightline#statusline(0)
            endfunction

            function! CtrlPStatusFuncProg(str)
                return lightline#statusline(0)
            endfunction

        " }
        " reload on colorscheme change {

            function! s:LightLineReload()
                if !exists('g:loaded_lightline')
                    return
                endif

                for l:theme in split(globpath(g:unmanaged_dir . 'customized_colorschemes/plugin/lightline/colorscheme', '*.vim'), '\n')
                    execute('source ' . l:theme)
                endfor

                let g:lightline.colorscheme = g:colors_name
                call lightline#init()
                call lightline#colorscheme()
                call lightline#update()
            endfunction

            augroup ReloadLightLineWhenColorSchemeChanges
                autocmd!
                autocmd ColorScheme * call s:LightLineReload()
            augroup END

        " }
    " }
    " neoformat {

        nmap <silent> <Leader>nf :Neoformat<CR>

    " }
    " netrw {

        let g:netrw_home = s:plugins_dir . 'netrw'
        let g:netrw_localcopycmd = 'copy'

    " }
    " typescript-vim {

        let g:typescript_compiler_binary = 'tsc'
        let g:typescript_compiler_options = ''

    " }
    " vim-colors-solarized {

        if has('gui_running')
            let g:solarized_bold = 0
            let g:solarized_underline = 0
            let g:solarized_italic = 0

            " https://github.com/altercation/vim-colors-solarized/issues/40
            call togglebg#map('')

            function! BackgroundToggle()
                ToggleBG
            endfunction

            nmap <silent> <F6> :call BackgroundToggle()<CR>
        endif

    " }
    " vim-dispatch {

        nmap <silent> <Leader>m :Make<CR>

    " }
    " vim-fugitive {

        augroup SetupFugitive
            autocmd!
            autocmd BufReadPost fugitive://* set bufhidden=delete
        augroup END

    " }
    " vim-javascript {

        let g:javascript_plugin_jsdoc = 1
        let g:javascript_plugin_ngdoc = 1

    " }
    " vim-js-pretty-template {

        augroup SetupJsPrettyTemplate 
            autocmd!
            autocmd FileType javascript,typescript JsPreTmpl markdown
            autocmd FileType typescript syn clear foldBraces
        augroup END

    " }
    " vim-jsx {

        let g:jsx_ext_required = 0

    " }
    " vim-markdown {

        let g:vim_markdown_folding_disabled = 1

    " }
    " vim-mundo {

        let g:mundo_help = 0
        let g:mundo_prefer_python3 = 1
        let g:mundo_width = 40

        nmap <silent> <Leader>u :MundoToggle<CR>

    " }
    " vimfiler.vim {

        let g:vimfiler_as_default_explorer = 1
        let g:vimfiler_data_directory = s:plugins_dir . 'vimfiler.vim'
        let g:vimfiler_force_overwrite_statusline = 0
        let g:vimfiler_ignore_pattern = []

        let g:vimfiler_file_icon = ' '
        let g:vimfiler_marked_file_icon = s:icons.star
        let g:vimfiler_readonly_file_icon = s:icons.padlock
        let g:vimfiler_tree_closed_icon = s:icons.greater_than
        let g:vimfiler_tree_leaf_icon = ' '

        nmap <silent> <Leader>f :VimFiler -toggle<CR>

        augroup SetupVimFiler
            autocmd!
            autocmd FileType vimfiler nmap <buffer> <Leader>f :VimFiler -toggle<CR>
        augroup END

    " }
" }
" unmanaged {
    " full_screen {

        if has('win32') && has('gui_running')
            nmap <silent> <F11> :ToggleFullScreen<CR>
            nmap <silent> <F12> :CycleAlpha<CR>
        endif

    " }
    " window_toggles {

        nmap <silent> <Leader>l :ToggleLocation<CR>
        nmap <silent> <Leader>q :ToggleQuickfix<CR>

    " }
" }
" colorscheme {

    function! HideTildeOnEmptyLines()
        if has('gui_running')
            highlight EndOfBuffer guifg=BG
        else
            highlight EndOfBuffer ctermfg=BG
        endif
    endfunction

    augroup HideTildeOnEmptyLinesWhenColorSchemeChanges
        autocmd!
        autocmd ColorScheme * call HideTildeOnEmptyLines()
    augroup END

    if has('gui_running')
        function! ApplyColorSchemePatch()
            let l:patch = g:unmanaged_dir . 'customized_colorschemes/patches/' . g:colors_name . '.vim'
            if filereadable(l:patch)
                execute('source ' . l:patch)
            endif
        endfunction

        augroup ApplyColorSchemePatchWhenColorSchemeChanges
            autocmd!
            autocmd ColorScheme * call ApplyColorSchemePatch()
        augroup END

        function! CycleColorSchemes()
            let g:THEME_INDEX = g:THEME_INDEX == len(s:themes) - 1 ? 0 : g:THEME_INDEX + 1
            exe('colorscheme ' . s:themes[g:THEME_INDEX])
        endfunction

        nmap <silent> <F5> :call CycleColorSchemes()<CR>
    else
        let &t_Co=256
    endif

    exec 'set background=' . GetCurrentBackground()
    exec 'colorscheme ' . GetCurrentColorScheme()

" }
" auto-commands {

    augroup SetFileTypesBasedOnExtensions
        autocmd!
        autocmd BufNewFile,BufRead *.cshtml set filetype=html
        autocmd BufNewFile,BufRead *.config,*.nuspec set filetype=xml
    augroup END

    augroup ConfigureEditorBasedOnFileTypes
        autocmd!
        autocmd FileType vim setlocal textwidth=0
        autocmd FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    augroup END

    augroup EnableSyntaxCompleteWhenNoLanguageSpecificOmniScript
        autocmd!
        autocmd Filetype * if (exists('+omnifunc') && &omnifunc == '') | setlocal omnifunc=syntaxcomplete#Complete | endif
    augroup END

    augroup ScrollToLastSeenLocationOnFileOpen
        autocmd!
        autocmd BufReadPost * if line("'\'") > 1 && line("'\'") <= line('$') | exe "normal! g`\'" | endif
    augroup END

    augroup DoNotOverwriteBackupFilesWithTheSameNames
        autocmd!
        autocmd BufWritePre * let &backupext = '@' . substitute(expand('%:p:h'), ',\\=[:\\\/]', '%', 'g')
    augroup END

" }
" mappings {

    vmap <Down> j
    vmap <Left> h
    vmap <Right> l
    vmap <Up> k

    nnoremap p "0p
    vnoremap p "0p
    nnoremap P "0P
    vnoremap P "0P

    nnoremap t "0d
    vnoremap t "0d
    nnoremap T "0D
    vnoremap T "0D

    nnoremap tt "0dd

    command! HlsearchOff nohlsearch
    nmap <silent> <Leader>h :HlsearchOff<CR>

    command! WrapToggle set wrap! linebreak! nolist
    nmap <silent> <Leader>w :WrapToggle<CR>

    command! ListToggle set list!
    nmap <silent> <Leader>t :ListToggle<CR>

    command! RelativeNumberToggle set rnu!
    nmap <silent> <F4> :RelativeNumberToggle<CR>

    command! SpellToggle set spell!
    nmap <silent> <F7> :SpellToggle<CR>

    command! -nargs=* DiffGet :diffget <args> | :diffupdate
    nmap <silent> <Leader>d1 :DiffGet 1<CR>
    nmap <silent> <Leader>d2 :DiffGet 2<CR>
    nmap <silent> <Leader>d3 :DiffGet 3<CR>

    command! -nargs=* DiffPut :diffput <args> | :diffupdate
    nmap <silent> <Leader>d4 :DiffPut 4<CR>

" }

