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

    let g:themes_dir = g:unmanaged_dir . 'themes'
    Plug g:themes_dir

    Plug 'altercation/vim-colors-solarized'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'chr4/nginx.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'digitaltoad/vim-pug'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'elzr/vim-json'
    Plug 'fatih/vim-go'
    Plug 'groenewege/vim-less'
    Plug 'GrzegorzKozub/vimdows'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf',
    Plug 'junegunn/fzf.vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'mattn/emmet-vim'
    Plug 'mhinz/vim-grepper'
    Plug 'mileszs/ack.vim'
    Plug 'moll/vim-node'
    Plug 'morhetz/gruvbox'
    Plug 'mxw/vim-jsx'
    Plug 'nelstrom/vim-visual-star-search'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'PProvost/vim-ps1'
    Plug 'Quramy/vim-js-pretty-template'
    Plug 'Raimondi/delimitMate'
    Plug 'rakr/vim-one'
    Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
    Plug 'scrooloose/nerdcommenter'
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
    set encoding=utf-8
    set expandtab
    set fillchars+=vert:\  " intentional trailing whitespace
    set foldlevelstart=99
    set foldmethod=syntax
    set hidden
    set hlsearch
    set ignorecase
    set infercase
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
            let s:screen = eval(vimdows#get_screen())

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

    let s:icons = { 'circle': '●', 'triangle': '▲', 'star': '*', 'vertical_bar': '│' }

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

    function! InitTheme() abort
        if exists('g:THEME') | return | endif
        let g:THEME = { 'current': 0, 'options': {} }
        if has('python3')
python3 << EOF
import vim, random;
vim.command("let g:THEME.current = %s" % random.randint(0, int(vim.eval("len(s:themes)")) - 1));
EOF
        endif
    endfunction

    call InitTheme()

    function! SetDefaultThemeOption(option, value) abort
        if !has_key(g:THEME.options, a:option)
            let g:THEME.options[a:option] = a:value
            wviminfo
        endif
    endfunction

    function! GetCurrentColorScheme() abort
        return has('gui_running') ? s:themes[g:THEME.current] : 'terminal'
    endfunction

    function! GetCurrentBackground() abort
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

        nnoremap <silent> <C-p> :CtrlP<CR>
        nnoremap <silent> <C-b> :CtrlPBuffer<CR>
        nnoremap <silent> <C-k> :CtrlPMRUFiles<CR>

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
            function! s:gruvboxCycleOptions() abort
                let l:values = [ 'soft', 'medium', 'hard' ]
                let l:option = &background ==# 'dark' ? 'gruvbox_contrast_dark' : 'gruvbox_contrast_light'
                let l:index = index(l:values, g:THEME.options[l:option])
                let g:THEME.options[l:option] = l:index == len(l:values) - 1 ? l:values[0] : l:values[l:index + 1]
            endfunction

            call SetDefaultThemeOption('gruvbox_contrast_dark', 'medium')
            call SetDefaultThemeOption('gruvbox_contrast_light', 'medium')

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

            function! LightLineFugitive() abort
                if &filetype ==# 'help'
                    return 'Help'
                elseif &filetype ==# 'Mundo'
                    return 'Mundo'
                elseif &filetype ==# 'MundoDiff'
                    return 'Mundo'
                elseif &filetype ==# 'qf'
                    return exists('w:quickfix_title') && w:quickfix_title ==# ':setloclist()' ? 'Location' : 'QuickFix'
                elseif &filetype ==# 'vim-plug'
                    return 'Plugins'
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

            function! LightLineFileName() abort
                if &filetype ==# 'Mundo'
                    return 'Tree'
                elseif &filetype ==# 'MundoDiff'
                    return 'Diff'
                elseif &filetype ==# 'qf'
                    return ''
                elseif &filetype ==# 'vim-plug'
                    return ''
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

            function! LightLineAleError() abort
                return matchstr(ALEGetStatusLine(), s:icons.circle . ' \d\+')
            endfunction

            function! LightLineAleWarning() abort
                return matchstr(ALEGetStatusLine(), s:icons.triangle . ' \d\+')
            endfunction

            function! LightLinePercent() abort
                return &filetype !~? 'Mundo\|MundoDiff' ? printf('%3d%%', (100 * line('.') / line('$'))) : ''
            endfunction

            function! LightLineLineInfo() abort
                return &filetype !~? 'Mundo\|MundoDiff' ? printf('%3d %3d', line('.'), col('.')) : ''
            endfunction

            function! LightLineFileEncoding() abort
                return strlen(&fileencoding) > 0 && &filetype !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug' ? &fileencoding : ''
            endfunction

            function! LightLineFileFormat() abort
                return strlen(&fileformat) > 0 && &filetype !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug' && expand('%:t') !=# 'ControlP' ? &fileformat : ''
            endfunction

            function! LightLineFileType() abort
                return strlen(&filetype) > 0 && &filetype !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug' ? &filetype : ''
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

            function! CtrlPStatusFuncMain(focus, byfname, regex, prev, item, next, marked) abort
                let g:lightline.ctrlp_item = a:item
                return lightline#statusline(0)
            endfunction

            function! CtrlPStatusFuncProg(str) abort
                return lightline#statusline(0)
            endfunction

        " }
        " reload on colorscheme change {

            function! s:LightLineReload() abort
                if !exists('g:loaded_lightline')
                    return
                endif

                for l:theme in split(globpath(g:themes_dir . '/plugin/lightline/colorscheme', '*.vim'), '\n')
                    exe 'source' fnameescape(l:theme)
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

        nnoremap <silent> <Leader>f :Neoformat<CR>

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
        endif

    " }
    " vim-dispatch {

        noremap <silent> <Leader>m :Make<CR>

    " }
    " vim-fugitive {

        augroup SetupFugitive
            autocmd!
            autocmd BufReadPost fugitive://* set bufhidden=delete
        augroup END

    " }
    " vim-grepper {

        let g:grepper = {}
        let g:grepper.highlight = 1

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
    " vim-mundo {

        let g:mundo_help = 0
        let g:mundo_prefer_python3 = 1
        let g:mundo_width = 40

        noremap <silent> <Leader>u :MundoToggle<CR>

    " }
" }
" colorscheme {

    function! HideTildeOnEmptyLines() abort
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

    function! ApplyBackground() abort
        exe 'set background=' . GetCurrentBackground()
    endfunction

    function! ApplyColorScheme() abort
        exe 'colorscheme' fnameescape(GetCurrentColorScheme())
    endfunction

    if has('gui_running')
        function! ApplyColorSchemePatch() abort
            let l:patch = g:themes_dir . '/patches/' . g:colors_name . '.vim'
            if filereadable(l:patch)
                exe 'source' fnameescape(l:patch)
            endif
        endfunction

        augroup ApplyColorSchemePatchWhenColorSchemeChanges
            autocmd!
            autocmd ColorScheme * call ApplyColorSchemePatch()
        augroup END

        function! ApplyThemeOptions() abort
            for l:option in keys(g:THEME.options)
                exe 'let g:' . l:option . ' = "' . g:THEME.options[l:option] . '"'
            endfor
        endfunction

        call ApplyThemeOptions()

        function! CycleColorSchemes() abort
            let g:THEME.current = g:THEME.current == len(s:themes) - 1 ? 0 : g:THEME.current + 1
            call ApplyColorScheme()
        endfunction

        nnoremap <silent> <F5> :call CycleColorSchemes()<CR>

        function! BackgroundToggle() abort
            let &background = &background ==# 'dark' ? 'light' : 'dark'
            call ApplyColorScheme()
        endfunction

        nnoremap <silent> <F6> :call BackgroundToggle()<CR>

        function! CycleThemeOptions() abort
            let l:function = 's:' . GetCurrentColorScheme() . 'CycleOptions()'
            if !exists('*' . l:function) | return | endif
            exe 'call ' . l:function
            call ApplyThemeOptions()
            call ApplyColorScheme()
        endfunction

        nnoremap <silent> <F7> :call CycleThemeOptions()<CR>
    else
        let &t_Co=256
    endif

    call ApplyBackground()
    call ApplyColorScheme()

" }
" auto-commands {

    augroup SetFileTypesBasedOnExtensions
        autocmd!
        autocmd BufNewFile,BufRead *.config set filetype=xml
        autocmd BufNewFile,BufRead *.cshtml set filetype=html
        autocmd BufNewFile,BufRead *.csx set filetype=cs
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

    vnoremap <Down> j
    vnoremap <Left> h
    vnoremap <Right> l
    vnoremap <Up> k

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
    nnoremap <silent> <Leader>h :HlsearchOff<CR>

    command! WrapToggle set wrap! linebreak! nolist
    nnoremap <silent> <Leader>w :WrapToggle<CR>

    command! ListToggle set list!
    nnoremap <silent> <Leader>t :ListToggle<CR>

    command! RelativeNumberToggle set rnu!
    nnoremap <silent> <Leader>n :RelativeNumberToggle<CR>

    command! SpellToggle set spell!
    nnoremap <silent> <Leader>s :SpellToggle<CR>

    function! ToggleList(kind, prefix) abort
        redir => l:buffers
        silent! buffers
        redir END
        exe a:prefix . (l:buffers =~# '\[' . a:kind . ' List\]' ? 'close' : 'open')
    endfunction

    nnoremap <silent> <Leader>l :call ToggleList('Location', 'l')<CR>
    nnoremap <silent> <Leader>q :call ToggleList('Quickfix', 'c')<CR>

" }
" diff and merge {

    augroup KeepWindowSizesEqualWhenResizingInDiffMode
        autocmd!
        autocmd VimResized * if &diff | wincmd = | endif
    augroup END

    function! VimDiff() abort
        let s:ft = &filetype
        windo if (winnr() != 1 && &ft == '') | :silent! exe 'set ft=' . s:ft | endif
        wincmd =
    endfunction 

    command! VimDiff call VimDiff()

    function! VimMerge() abort
        let s:ft = &filetype
        windo if (winnr() != 1 && &ft == '') | :silent! exe 'set ft=' . s:ft | endif
        wincmd b
        wincmd J
        if search('') > 0 | :e ++fileformat=dos | endif
        diffupdate
    endfunction

    command! VimMerge call VimMerge()

    command! -nargs=* DiffGet :diffget <args> | :diffupdate
    nnoremap <silent> <Leader>d1 :DiffGet 1<CR>
    nnoremap <silent> <Leader>d2 :DiffGet 2<CR>
    nnoremap <silent> <Leader>d3 :DiffGet 3<CR>

    command! -nargs=* DiffPut :diffput <args> | :diffupdate
    nnoremap <silent> <Leader>d4 :DiffPut 4<CR>

" }

