" vim: set foldmarker={,} foldmethod=marker :

" includes {

    runtime defaults.vim
    runtime mswin.vim

" }
" directories {

    let s:vim_data_dir = expand('~/.vim/')
    let s:vim_backup_dir = s:vim_data_dir . 'backup/'
    let s:vim_undo_dir = s:vim_data_dir . 'undo/'
    let s:vim_plugin_data_dir = s:vim_data_dir . 'plugins/'

    silent! call mkdir(s:vim_backup_dir, 'p')
    silent! call mkdir(s:vim_undo_dir, 'p')
    silent! call mkdir(s:vim_plugin_data_dir, 'p')

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
    set fillchars+=vert:\
    set foldlevelstart=99
    set foldmethod=syntax
    set hidden
    set hlsearch
    set ignorecase
    set lazyredraw
    set nojoinspaces
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
    set wildignore+=*.7z,*.bmp,*.dll,*.exe,*.gif,*.ico,*.icl,*.jpeg,*.jpg,*.ldf,*.png,*.rar,*.sdf,*.sqlite,*.suo,*.zip
    set wildmode=list:longest

    let &backupdir = s:vim_backup_dir
    let &undodir = s:vim_undo_dir
    let &viminfo = &viminfo . ',n' . s:vim_data_dir . '.viminfo'

    scriptencoding 'utf-8'
    language English_US

    if has('gui_running')
        set columns=160
        set cursorline
        set guifont=Fira\ Code\ Medium:h13:cEASTEUROPE
        set guioptions+=c
        set guioptions-=b
        set guioptions-=r
        set guioptions-=L
        set guioptions-=m
        set guioptions+=M
        set guioptions-=T
        set guitablabel=%t\ %M
        set laststatus=2
        set lines=46
        set linespace=0
        set listchars=tab:→\ ,eol:¬,trail:·
        set noshowmode
        "set renderoptions=type:directx,gamma:1.8,contrast:0.5,level:0.5,geom:1,renmode:5,taamode:1

        winpos 75 320
    else
        set listchars=tab:»\ ,eol:¬,trail:_
    endif

" }
" vim-plug {

    call plug#begin($VIM . '/plugins')

    let g:unmanaged_dir = $VIM . '/unmanaged/'

    Plug g:unmanaged_dir . 'compilers', { 'for': [ 'c', 'cpp' ] }
    Plug g:unmanaged_dir . 'customized_colorschemes'
    Plug g:unmanaged_dir . 'diff_and_merge', { 'on': [ 'VimDiff', 'VimMerge' ] }
    Plug g:unmanaged_dir . 'full_screen', { 'on': [ 'CycleAlpha', 'ToggleFullScreen' ] }
    Plug g:unmanaged_dir . 'screen_memento'
    Plug g:unmanaged_dir . 'window_toggles', { 'on': [ 'ToggleLocation', 'ToggleQuickfix' ] }

    Plug 'mileszs/ack.vim'
    Plug 'w0rp/ale'
    Plug 'chriskempson/base16-vim'
    Plug 'ctrlpvim/ctrlp.vim', { 'on': [ 'CtrlP', 'CtrlPBuffer', 'CtrlPMRUFiles' ] }
    Plug 'Raimondi/delimitMate'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'mattn/emmet-vim'
    Plug 'morhetz/gruvbox'
    Plug 'othree/html5.vim'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'leafgarland/typescript-vim'
    Plug 'Shougo/unite.vim', { 'on': 'VimFiler' }
    Plug 'altercation/vim-colors-solarized'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'tpope/vim-dispatch'
    Plug 'svermeulen/vim-easyclip'
    Plug 'tpope/vim-fugitive'
    Plug 'pangloss/vim-javascript'
    Plug 'tpope/vim-jdaddy'
    Plug 'Quramy/vim-js-pretty-template'
    Plug 'elzr/vim-json'
    Plug 'mxw/vim-jsx'
    Plug 'groenewege/vim-less'
    Plug 'plasticboy/vim-markdown'
    Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
    Plug 'moll/vim-node'
    Plug 'digitaltoad/vim-pug'
    Plug 'PProvost/vim-ps1'
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'nelstrom/vim-visual-star-search'
    Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }

    call plug#end()

" }
" plugins {
    " ack.vim {

        if executable('ag')
            let g:ackprg = 'ag --vimgrep'
        endif

    " }
    " ALE {

        let g:ale_linters = {
            \ 'vim': []
        \ }

        let g:ale_sign_error = '●'
        let g:ale_sign_warning = '▲'
        let g:ale_statusline_format = [ '● %d', '▲ %d', '' ]
    " }
    " ctrlp.vim {

        let g:ctrlp_cache_dir = s:vim_plugin_data_dir . 'ctrlp.vim'

        nmap <silent> <C-p> :CtrlP<CR>
        nmap <silent> <C-b> :CtrlPBuffer<CR>
        nmap <silent> <C-k> :CtrlPMRUFiles<CR>

    " }
    " emmet-vim {

        let g:user_emmet_install_global = 0
        autocmd FileType html,css EmmetInstall

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
    " javascript-libraries-syntax.vim {

        let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter,react,requirejs,jasmine,chai'

    " }
    " lightline {

        if has('gui_running')

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
                \ 'colorscheme': '' . strftime('%a') =~# 'Sat\|Sun' ? 'gruvbox' : 'solarized' . '',
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
                    \ 'left': '',
                    \ 'right': ''
                \ },
                \ 'subseparator': {
                    \ 'left': '',
                    \ 'right': ''
                \ },
                \ 'enable': {
                    \ 'tabline': 0
                \ },
            \ }

        " }
        " component functions {

            function! LightLineFugitive()
                if &ft ==# 'help'
                    return 'Help'
                elseif &ft ==# 'Mundo'
                    return 'Mundo'
                elseif &ft ==# 'MundoDiff'
                    return 'Mundo'
                elseif &ft ==# 'qf'
                    return exists('w:quickfix_title') ? 'Location' : 'QuickFix'
                elseif &ft ==# 'vim-plug'
                    return 'Plugins'
                elseif &ft ==# 'vimfiler'
                    return 'VimFiler'
                elseif expand('%:t') ==# 'ControlP'
                    return 'CtrlP'
                endif
                if exists('*fugitive#head')
                    let l:branch = fugitive#head()
                    return l:branch !=# '' ? ' '.l:branch : ''
                endif
                return ''
            endfunction

            function! LightLineFileName()
                if &ft ==# 'Mundo'
                    return 'Tree'
                elseif &ft ==# 'MundoDiff'
                    return 'Diff'
                elseif &ft ==# 'qf'
                    return ''
                elseif &ft ==# 'vim-plug'
                    return ''
                elseif &ft ==# 'vimfiler'
                    return substitute(vimfiler#get_status_string(), '\*safe\*', '', '')
                elseif expand('%:t') ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item')
                    if g:lightline.ctrlp_item ==# 'files'
                        return 'Files'
                    elseif g:lightline.ctrlp_item ==# 'mru files'
                        return 'Recent'
                    endif
                    return 'Buffers'
                endif
                let l:filename = expand('%:t') ==# '' ? '[No Name]' : expand('%:t')
                if &ft ==# 'help'
                    return l:filename
                endif
                return l:filename . (&readonly ? ' ' : '') . (&modified ? ' ●' : '')
            endfunction

            function! LightLineAleError()
                return matchstr(ALEGetStatusLine(), '● \d\+')
            endfunction

            function! LightLineAleWarning()
                return matchstr(ALEGetStatusLine(), '▲ \d\+')
            endfunction

            function! LightLinePercent()
                return &ft !~? 'Mundo\|MundoDiff' ? printf('%3d%%', (100 * line('.') / line('$'))) : ''
            endfunction

            function! LightLineLineInfo()
                return &ft !~? 'Mundo\|MundoDiff' ? printf('%3d %3d', line('.'), col('.')) : ''
            endfunction

            function! LightLineFileEncoding()
                return strlen(&fenc) > 0 && &ft !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug\|vimfiler' ? &fenc : ''
            endfunction

            function! LightLineFileFormat()
                return strlen(&ff) > 0 && &ft !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug\|vimfiler' && expand('%:t') !=# 'ControlP' ? &ff : ''
            endfunction

            function! LightLineFileType()
                return strlen(&ft) > 0 && &ft !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug\|vimfiler' ? &ft : ''
            endfunction

        " }
        " ALE integration {

            augroup ALELightLineUpdate
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

                "for l:vanila_colorscheme_file in split(globpath($VIM . '\plugins\lightline.vim\autoload\lightline\colorscheme', '*.vim'), '\n')
                    "execute('source ' . l:vanila_colorscheme_file)
                "endfor

                for l:customized_colorscheme_file in split(globpath($VIM . '\unmanaged\customized_colorschemes\plugin\lightline\colorscheme', '*.vim'), '\n')
                    execute('source ' . l:customized_colorscheme_file)
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

        endif

    " }
    " neoformat {

        nmap <silent> <Leader>nf :Neoformat<CR>

    " }
    " netrw {

        let g:netrw_home = s:vim_plugin_data_dir . 'netrw'
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
    " vim-easyclip {

        let g:EasyClipShareYanks = 1
        let g:EasyClipShareYanksDirectory = s:vim_plugin_data_dir
        let g:EasyClipUseCutDefaults = 0

        nmap t <plug>MoveMotionPlug
        xmap t <plug>MoveMotionXPlug
        nmap tt <plug>MoveMotionLinePlug

    " }
    " vim-fugitive {

        if has('autocmd')
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
        let g:vimfiler_data_directory = s:vim_plugin_data_dir . 'vimfiler.vim'
        let g:vimfiler_force_overwrite_statusline = 0
        let g:vimfiler_ignore_pattern = []

        let g:vimfiler_file_icon = ' '
        let g:vimfiler_marked_file_icon = '✔'
        let g:vimfiler_readonly_file_icon = ''
        let g:vimfiler_tree_closed_icon = '▶'
        let g:vimfiler_tree_leaf_icon = ' '
        let g:vimfiler_tree_opened_icon = '▼'

        nmap <silent> <Leader>f :VimFiler -toggle<CR>
        autocmd FileType vimfiler nmap <buffer> <Leader>f :VimFiler -toggle<CR>

    " }
" }
" unmanaged {
    " compilers {

        if has('autocmd')
            autocmd FileType c,cpp compiler gcc
        endif

    " }
    " full_screen {

        if has('gui_running')
            nmap <silent> <F11> :ToggleFullScreen<CR>
            nmap <silent> <F12> :CycleAlpha<CR>
        endif

    " }
    " screen_memento {

        if has('gui_running')
            let g:screen_memento_dir = s:vim_plugin_data_dir
        endif

    " }
    " window_toggles {

        nmap <silent> <Leader>l :ToggleLocation<CR>
        nmap <silent> <Leader>q :ToggleQuickfix<CR>

    " }
" }
" colorscheme {

    function! HideTildeOnEmptyLines()
        highlight EndOfBuffer guifg=BG
    endfunction

    if has('autocmd')
        augroup ColorSchemeHideTildeOnEmptyLines
            autocmd!
            autocmd ColorScheme * call HideTildeOnEmptyLines()
        augroup END
    endif

    if has('gui_running')
        if strftime('%H') > 6 && strftime('%H') < 18
            set background=light
        else
            set background=dark
        endif

        if strftime('%a') =~# 'Sat\|Sun'
            colorscheme gruvbox
        else
            colorscheme solarized
        endif

        function! CycleColorSchemes()
            let l:all = ['solarized', 'gruvbox']
            let l:current = index(l:all, g:colors_name)
            exe('colorscheme ' . (l:current == len(l:all) - 1 ? l:all[0] : l:all[l:current + 1]))
        endfunction

        nmap <silent> <F5> :call CycleColorSchemes()<CR>
    else
        set background=dark
        colorscheme default
    endif

" }
" auto-commands {

    if has('autocmd')

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
        autocmd Filetype * if (exists('+omnifunc') && &omnifunc == '') | setlocal omnifunc=syntaxcomplete#Complete | endif

    " }
    " other {

        " after a file is open, go to the last visited location
        autocmd BufReadPost * if line("'\'") > 1 && line("'\'") <= line('$') | exe "normal! g`\'" | endif

        " do not overwrite the backup files of the same name
        autocmd BufWritePre * let &backupext = '@' . substitute(expand('%:p:h'), ',\\=[:\\\/]', '%', 'g')

        " source .vimrc when it's saved
        autocmd! BufWritePost $MYVIMRC nested source $MYVIMRC

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

    command! -nargs=* DiffGet :diffget <args> | :diffupdate
    nmap <silent> <Leader>d1 :DiffGet 1<CR>
    nmap <silent> <Leader>d2 :DiffGet 2<CR>
    nmap <silent> <Leader>d3 :DiffGet 3<CR>

    command! -nargs=* DiffPut :diffput <args> | :diffupdate
    nmap <silent> <Leader>d4 :DiffPut 4<CR>

" }

