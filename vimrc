" vim: set foldmarker={,} foldmethod=marker :

" includes {

  runtime defaults.vim
  runtime mswin.vim

" }
" platform {

  let s:windows = has('win32')
  let s:linux = !s:windows

" }
" directories {

  if s:windows
    let s:user_dir = expand('~/vimfiles/')
  else
    let s:user_dir = expand('~/.vim/')
  endif

  let s:plugins_dir = s:user_dir . 'plugins/'

  let s:temp_dir = s:user_dir . 'temp/'

  let s:backup_dir = s:temp_dir . 'backup/'
  let s:undo_dir = s:temp_dir . 'undo/'
  let s:temp_plugins_dir = s:temp_dir . 'plugins/'

  silent! call mkdir(s:plugins_dir, 'p')

  silent! call mkdir(s:backup_dir, 'p')
  silent! call mkdir(s:undo_dir, 'p')
  silent! call mkdir(s:temp_plugins_dir, 'p')

" }
" vim-plug {

  call plug#begin(s:plugins_dir)

  let g:unmanaged_dir = s:user_dir . 'unmanaged/'

  let g:themes_dir = g:unmanaged_dir . 'themes'
  Plug g:themes_dir

  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'chr4/nginx.vim', { 'for': 'nginx' }
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
  Plug 'elixir-editors/vim-elixir', { 'for': [ 'elixir', 'eelixir' ] }
  Plug 'elzr/vim-json', { 'for': 'json' }
  Plug 'ericbn/vim-solarized'
  Plug 'fatih/vim-go', { 'for': 'go' }
  Plug 'groenewege/vim-less', { 'for': 'less' }
  Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }
  Plug 'GrzegorzKozub/vimdows'
  Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'less', 'scss' ] }
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'mattn/emmet-vim'
  Plug 'mhinz/vim-grepper'
  Plug 'mileszs/ack.vim'
  Plug 'moll/vim-node'
  Plug 'morhetz/gruvbox'
  Plug 'mxw/vim-jsx'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
  Plug 'othree/html5.vim', { 'for': [ 'eelixir', 'html' ] }
  Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'javascript.jsx', 'typescript' ] }
  Plug 'PProvost/vim-ps1', { 'for': 'ps1' }
  Plug 'Quramy/vim-js-pretty-template', { 'for': [ 'javascript', 'javascript.jsx', 'typescript' ] }
  Plug 'Raimondi/delimitMate'
  Plug 'rakr/vim-one'
  Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
  Plug 'scrooloose/nerdcommenter'
  Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
  Plug 'stephpy/vim-yaml', { 'for': [ 'yaml', 'yaml.docker-compose' ] }
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-endwise', { 'for': [ 'elixir', 'eelixir', 'ruby' ] }
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-jdaddy', { 'for': 'json' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
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
  set shiftwidth=2
  set shortmess+=I
  set showmatch
  set sidescroll=1
  set sidescrolloff=15
  set smartcase
  set smartindent
  set smarttab
  set softtabstop=2
  set spelllang=en_gb,pl
  set tabstop=2
  set undofile
  set ttyfast
  set wildmode=list:longest

  let &backupdir = s:backup_dir
  let &undodir = s:undo_dir
  let &viminfo = &viminfo . ',!,n' . s:temp_dir . 'viminfo'

  try | rviminfo | catch | endtry

  scriptencoding 'utf-8'

  if s:windows
    language English_US
  else
    language en_US.utf8
  endif

" }
" icons {

  let g:icons = { 'circle': '●', 'triangle': '▲', 'star': '*', 'vertical_bar': '│' }

  let g:icons.left_filled = ''
  let g:icons.right_filled = ''
  let g:icons.left_empty = g:icons.vertical_bar
  let g:icons.right_empty = g:icons.vertical_bar

  let g:icons.branch = ''
  let g:icons.padlock = ''

  let g:icons.space = ''

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
    return s:themes[g:THEME.current]
  endfunction

  function! GetCurrentBackground() abort
    return (strftime('%H') > 6 && strftime('%H') < 18) ? 'light' : 'dark'
  endfunction

" }
" plugins {
  " ack.vim {

    if executable('rg')
      let g:ackprg = 'rg --vimgrep'
    endif

  " }
  " ALE {

    let g:ale_fixers = {}
    let g:ale_linters = {}

    let g:ale_completion_enabled = 0
    let g:ale_lint_on_enter = 0

    let g:ale_sign_error = g:icons.circle
    let g:ale_sign_warning = g:icons.triangle

    function! GetAleCounts() abort
      return ale#statusline#Count(bufnr('%'))
    endfunction

    " elixir {

      let g:ale_elixir_elixir_ls_release = s:plugins_dir . 'vim-elixirls/elixir-ls/release'
      let g:ale_elixir_elixir_ls_config = { 'elixirLS': { 'dialyzerEnabled': v:false } }

      let g:ale_fixers.elixir = [ 'mix_format' ]
      let g:ale_linters.elixir = [ 'credo', 'elixir-ls' ]

      augroup UseALEForElixir
        autocmd FileType elixir,eelixir nnoremap <Leader>f :ALEFix<CR>
        autocmd FileType elixir,eelixir nnoremap <C-]> :ALEGoToDefinition<CR>
        autocmd FileType elixir,eelixir nnoremap <C-[> :ALEFindReferences<CR>
      augroup END

    " }
  " }
  " ctrlp.vim {

    let g:ctrlp_cache_dir = s:temp_plugins_dir . 'ctrlp.vim'

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
  " fzf.vim {

    let g:fzf_layout = { 'down': '~33%' }

    nnoremap <silent> <C-f>f :Files<CR>
    nnoremap <silent> <C-f>g :GFiles<CR>
    nnoremap <silent> <C-f>b :Buffers<CR>
    nnoremap <silent> <C-f>k :History<CR>

  " }
  " gruvbox {

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

  " }
  " markdown-preview.nvim {

    nnoremap <silent> <Leader>mp :MarkdownPreview<CR>
    nnoremap <silent> <Leader>mps :MarkdownPreviewStop<CR>

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
          \ 'left': g:icons.left_filled,
          \ 'right': g:icons.right_filled
        \ },
        \ 'subseparator': {
          \ 'left': g:icons.left_empty,
          \ 'right': g:icons.right_empty
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
            return g:icons.branch . g:icons.space . l:branch
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
        return l:filename . (&readonly ? g:icons.space . g:icons.padlock : '') . (&modified ? ' ' . g:icons.star : '')
      endfunction

      function! LightLineFormatAleIcon(count, icon) abort
        return a:count > 0 ? a:icon . ' ' . a:count : ''
      endfunction

      function! LightLineAleError() abort
        return LightLineFormatAleIcon(GetAleCounts().error, g:icons.circle)
      endfunction

      function! LightLineAleWarning() abort
        return LightLineFormatAleIcon(GetAleCounts().warning, g:icons.triangle)
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

    let g:netrw_banner = 0
    let g:netrw_home = s:temp_plugins_dir . 'netrw'
    let g:netrw_localcopycmd = 'copy'

  " }
  " typescript-vim {

    let g:typescript_compiler_binary = 'tsc'
    let g:typescript_compiler_options = ''

  " }
  " vim-colors-solarized {

    let g:solarized_bold = 0
    let g:solarized_underline = 0
    let g:solarized_italic = 0

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
      autocmd FileType javascript,javascript.jsx,typescript JsPreTmpl
      autocmd FileType typescript syn clear foldBraces
    augroup END

  " }
  " vim-json {

    let g:vim_json_syntax_conceal = 0

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
    highlight EndOfBuffer guifg=BG ctermfg=BG
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

  if s:linux
    set termguicolors
  else
    let &t_Co=256
  endif

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

  call ApplyBackground()
  call ApplyColorScheme()

" }
" terminal {

  nnoremap <Leader>t :botright terminal ++close pwsh --nologo<CR>

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

  nnoremap <C-C> <C-A>

  unmap <C-S>
  unmap <C-Y>
  unmap <C-Z>

  if has('gui')
    unmap <C-F>
    unmap <C-H>
  endif

  vnoremap <Down> j
  vnoremap <Left> h
  vnoremap <Right> l
  vnoremap <Up> k

  command! HlsearchOff nohlsearch
  nnoremap <silent> <Leader>h :HlsearchOff<CR>

  command! WrapToggle set wrap! linebreak! nolist
  nnoremap <silent> <Leader>w :WrapToggle<CR>

  command! ListToggle set list!
  nnoremap <silent> <Leader>i :ListToggle<CR>

  command! RelativeNumberToggle set relativenumber!
  nnoremap <silent> <Leader>r :RelativeNumberToggle<CR>

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

