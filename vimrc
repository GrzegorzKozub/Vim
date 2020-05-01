" vim: set foldmarker={,} foldmethod=marker :

" os {

  let s:windows = has('win32')
  let s:linux = !s:windows
  let s:mac = s:linux && system('uname -s') =~# 'Darwin'

  let s:neovim = has('nvim')
  let s:vim = !s:neovim

" }
" dirs {

  if s:neovim

    let s:config_dir = stdpath('config')
    let s:data_dir = stdpath('data')

  else

    if s:windows

      let s:config_dir = expand('~/vimfiles')
      let s:data_dir = s:config_dir . '/data'

    else

      if empty($XDG_CONFIG_HOME)
        let s:config_dir = expand('~/.config/vim')
        set runtimepath=~/.config/vim,$VIMRUNTIME,~/.config/vim/after
      else
        let s:config_dir = expand($XDG_CONFIG_HOME . '/vim')
        set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
      endif

      if empty($XDG_DATA_HOME)
        let s:data_dir = expand('~/.local/share/vim')
      else
        let s:data_dir = expand($XDG_DATA_HOME . '/vim')
      endif

    endif

  endif

  let s:plugins_dir = s:config_dir . '/plugins'
  let s:unmanaged_dir = s:config_dir . '/unmanaged'

  silent! call mkdir(s:plugins_dir, 'p')

  let s:backup_dir = s:data_dir . '/backup'
  let s:state_dir = s:data_dir . '/state'
  let s:undo_dir = s:data_dir . '/undo'

  silent! call mkdir(s:backup_dir, 'p')
  silent! call mkdir(s:state_dir, 'p')
  silent! call mkdir(s:undo_dir, 'p')

" }
" vim-plug {

  call plug#begin(s:plugins_dir)

  let g:themes_dir = s:unmanaged_dir . '/themes'
  Plug g:themes_dir

  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'chr4/nginx.vim', { 'for': 'nginx' }
  Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
  Plug 'elixir-editors/vim-elixir', { 'for': [ 'elixir', 'eelixir' ] }
  Plug 'elzr/vim-json', { 'for': 'json' }
  Plug 'fatih/vim-go', { 'for': 'go' }
  Plug 'groenewege/vim-less', { 'for': 'less' }
  Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }
  Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'less', 'scss' ] }
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'lifepillar/vim-solarized8'
  Plug 'mattn/emmet-vim', { 'for': [ 'css', 'html' ] }
  Plug 'mhinz/vim-grepper'
  Plug 'mileszs/ack.vim'
  Plug 'moll/vim-node'
  Plug 'mxw/vim-jsx'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
  Plug 'othree/html5.vim', { 'for': [ 'eelixir', 'html' ] }
  Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'javascript.jsx', 'typescript' ] }
  Plug 'PProvost/vim-ps1', { 'for': 'ps1' }
  Plug 'Quramy/vim-js-pretty-template', { 'for': [ 'javascript', 'javascript.jsx', 'typescript' ] }
  Plug 'Raimondi/delimitMate'
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

  if s:windows
    Plug 'GrzegorzKozub/vimdows'
  endif

  call plug#end()

" }
" settings {

  set autoindent
  set autoread
  set backspace=indent,eol,start
  set backup
  set belloff=all

  if has('nvim-0.3.2') || has('patch-8.1.0360')
    set diffopt+=algorithm:histogram,indent-heuristic,context:3
  endif

  set display+=lastline
  set encoding=utf-8
  set expandtab
  set fillchars+=vert:\  " intentional trailing whitespace
  set foldlevelstart=99
  set foldmethod=syntax
  set hidden
  set history=1000
  set hlsearch
  set ignorecase
  set infercase
  set incsearch
  set laststatus=2
  set lazyredraw
  set listchars=tab:→\ ,eol:¬,trail:·
  set mouse=a
  set nojoinspaces
  set nolangremap
  set noshowmode
  set noswapfile
  set nowrap
  set nrformats-=octal
  set number
  set scrolloff=3
  set shiftwidth=2
  set shortmess+=I
  set showcmd
  set showmatch
  set sidescroll=1
  set sidescrolloff=15
  set smartcase
  set smartindent
  set smarttab
  set softtabstop=2
  set spelllang=en_gb,pl
  set splitbelow
  set splitright
  set tabstop=2
  set termguicolors
  set ttimeout
  set ttimeoutlen=50
  set undofile
  set whichwrap+=<,>,[,]
  set wildmenu
  set wildmode=longest:full,full

  let &backupdir = s:backup_dir
  let &undodir = s:undo_dir

  if s:vim
    set cursorline " not for neovim until https://github.com/neovim/neovim/issues/9019 is fixed
    set ttyfast
    let &viminfo = &viminfo . ',!,n' . s:data_dir . '/viminfo'
  endif

  if s:neovim && s:windows
    let g:node_host_prog = substitute($APPDATA, '\', '/', 'g') . '/npm/node_modules/neovim/bin/cli.js'
  endif

  if s:linux

    " https://github.com/mintty/mintty/wiki/Tips#mode-dependent-cursor-in-vim
    let &t_EI .= "\e[1 q"
    let &t_SI .= "\e[5 q"
    let &t_te .= "\e[0 q"
    let &t_ti .= "\e[1 q"

    if &term ==# 'screen-256color'

      " unbreak termguicolors under tmux
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

      " unbreak ctrl+arrows under tmux
      exe "set <xUp>=\e[1;*A"
      exe "set <xDown>=\e[1;*B"
      exe "set <xRight>=\e[1;*C"
      exe "set <xLeft>=\e[1;*D"

    endif

  endif

  try
    rviminfo " using rshada locks the g:THEME variable making it read-only
  catch | endtry

  filetype plugin indent on
  scriptencoding 'utf-8'
  syntax on

  if s:windows | language English_US | elseif s:mac | language en_US.UTF-8 | else | language en_US.utf8 | endif

" }
" themes {

  let s:themes = [ 'solarized8', 'gruvbox8' ]

  function! s:init_theme() abort
    if exists('g:THEME') | return | endif
    let g:THEME = { 'colorscheme': 0, 'background': 'light' }
    if has('python3')
python3 << EOF
import vim, random;
vim.command("let g:THEME.colorscheme = %s" % random.randint(0, int(vim.eval("len(s:themes)")) - 1));
EOF
    endif
  endfunction

  call s:init_theme()

  function! s:get_current_color_scheme() abort
    return s:themes[g:THEME.colorscheme]
  endfunction

  function! s:get_current_background() abort
    return g:THEME.background
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

    let g:ale_icons = { 'circle': '●', 'triangle': '▲' }

    let g:ale_sign_error = g:ale_icons.circle
    let g:ale_sign_warning = g:ale_icons.triangle

    function! s:get_ale_counts() abort
      return ale#statusline#Count(bufnr('%'))
    endfunction

    " elixir {

      let g:ale_elixir_elixir_ls_release = s:plugins_dir . '/vim-elixirls/elixir-ls/release'
      let g:ale_elixir_elixir_ls_config = { 'elixirLS': { 'dialyzerEnabled': v:false } }

      let g:ale_fixers.elixir = [ 'mix_format' ]
      let g:ale_linters.elixir = [ 'elixir-ls' ]

      augroup UseALEForElixir
        autocmd FileType elixir,eelixir nnoremap <Leader>f :ALEFix<CR>
        autocmd FileType elixir,eelixir nnoremap <C-]> :ALEGoToDefinition<CR>
        autocmd FileType elixir,eelixir nnoremap <C-\> :ALEFindReferences<CR>
      augroup END

    " }
  " }
  " emmet-vim {

    let g:user_emmet_install_global = 0

    augroup SetupEmmet
      autocmd!
      autocmd FileType html,css EmmetInstall
    augroup END

  " }
  " fzf-vim {

    if s:linux
      let g:fzf_colors = {
        \ 'bg':      [ 'bg', 'Normal' ],
        \ 'bg+':     [ 'bg', 'Normal' ],
        \ 'fg':      [ 'fg', 'Comment' ],
        \ 'fg+':     [ 'fg', 'Normal' ],
        \ 'header':  [ 'fg', 'Keyword' ],
        \ 'hl':      [ 'fg', 'IncSearch' ],
        \ 'hl+':     [ 'fg', 'IncSearch' ],
        \ 'info':    [ 'fg', 'Comment' ],
        \ 'marker':  [ 'fg', 'Normal' ],
        \ 'pointer': [ 'fg', 'Normal' ],
        \ 'prompt':  [ 'fg', 'Underlined' ]
      \ }
    endif

    if s:windows || s:neovim
      " https://github.com/junegunn/fzf/blob/master/README-VIM.md#fzf-inside-terminal-buffer
      augroup HideFzfStatusLine
        autocmd!
        autocmd FileType fzf set laststatus=0 noruler
          \ | autocmd BufLeave <buffer> set laststatus=2 ruler
      augroup END
    endif

    let s:fzf_options = [ '--marker', '•', '--no-bold', '--no-info', '--pointer', '●', '--prompt' ]
    let s:fzf_prompt = ' ●• '

    command! -bang -nargs=? -complete=dir Buffers
      \ call fzf#vim#buffers(<q-args>, { 'options': s:fzf_options + [ 'BUFFERS' . s:fzf_prompt ] }, <bang>0)
    nnoremap <silent> <Leader>fb :Buffers<CR>
    nnoremap <silent> <C-b> :Buffers<CR>

    command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, { 'options': s:fzf_options + [ 'FILES' . s:fzf_prompt ] }, <bang>0)
    nnoremap <silent> <Leader>ff :Files<CR>
    nnoremap <silent> <C-p> :Files<CR>

    command! -bang -nargs=? -complete=dir History
      \ call fzf#vim#history({ 'options': s:fzf_options + [ 'HISTORY' . s:fzf_prompt ] }, <bang>0)
    nnoremap <silent> <Leader>fh :History<CR>
    nnoremap <silent> <C-k> :History<CR>

    command! -bang -nargs=? -complete=dir Commands
      \ call fzf#vim#command_history({ 'options': s:fzf_options + [ 'COMMANDS' . s:fzf_prompt ] }, <bang>0)
    nnoremap <silent> <Leader>fc :Commands<CR>

    command! -bang -nargs=? -complete=dir Searches
      \ call fzf#vim#search_history({ 'options': s:fzf_options + [ 'SEARCHES ●• ' ] }, <bang>0)
    nnoremap <silent> <Leader>fs :Searches<CR>

  " }
  " markdown-preview.nvim {

    nnoremap <silent> <Leader>mp :MarkdownPreview<CR>
    nnoremap <silent> <Leader>mps :MarkdownPreviewStop<CR>

  " }
  " lightline.vim {
    " configuration {

      let g:lightline_icons = {
        \ 'modified': '*',
        \ 'left_filled': '',
        \ 'right_filled': '',
        \ 'left_empty': '│',
        \ 'right_empty': '│',
        \ 'branch': '',
        \ 'padlock': '',
        \ 'space': ''
      \ }

      let g:lightline_rich_icons = {
        \ 'modified': '*',
        \ 'left_filled': '',
        \ 'right_filled': '',
        \ 'left_empty': '',
        \ 'right_empty': '',
        \ 'branch': '',
        \ 'padlock': '',
        \ 'space': ' '
      \ }

      if s:linux
        let g:lightline_icons = g:lightline_rich_icons
      endif

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
          \ 'fugitive': 'g:LightLineFugitive',
          \ 'filename': 'g:LightLineFileName',
          \ 'percent': 'g:LightLinePercent',
          \ 'lineinfo': 'g:LightLineLineInfo',
          \ 'fileencoding': 'g:LightLineFileEncoding',
          \ 'fileformat': 'g:LightLineFileFormat',
          \ 'filetype': 'g:LightLineFileType'
        \ },
        \ 'component_expand': {
          \ 'aleerror': 'LightLineAleError',
          \ 'alewarning': 'LightLineAleWarning'
        \ },
        \ 'component_type': {
          \ 'aleerror': 'error',
          \ 'alewarning': 'warning'
        \ },
        \ 'colorscheme': '' . s:get_current_color_scheme() . '',
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
          \ 'left': g:lightline_icons.left_filled,
          \ 'right': g:lightline_icons.right_filled
        \ },
        \ 'subseparator': {
          \ 'left': g:lightline_icons.left_empty,
          \ 'right': g:lightline_icons.right_empty
        \ },
        \ 'enable': {
          \ 'tabline': 0
        \ },
      \ }

    " }
    " component functions {

      function! g:LightLineFugitive() abort
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
        endif
        if exists('*FugitiveHead')
          let l:branch = FugitiveHead()
          if l:branch !=# ''
            return g:lightline_icons.branch . g:lightline_icons.space . l:branch
          endif
          return ''
        endif
        return ''
      endfunction

      function! g:LightLineFileName() abort
        if &filetype ==# 'Mundo'
          return 'Tree'
        elseif &filetype ==# 'MundoDiff'
          return 'Diff'
        elseif &filetype ==# 'qf'
          return ''
        elseif &filetype ==# 'vim-plug'
          return ''
        endif
        let l:filename = expand('%:t') ==# '' ? '[No Name]' : expand('%:t')
        if &filetype ==# 'help'
          return l:filename
        endif
        return l:filename . (&readonly ? g:lightline_icons.space . g:lightline_icons.padlock : '') . (&modified ? ' ' . g:lightline_icons.modified : '')
      endfunction

      function! g:LightLineFormatAleIcon(count, icon) abort
        return a:count > 0 ? a:icon . ' ' . a:count : ''
      endfunction

      function! g:LightLineAleError() abort
        return LightLineFormatAleIcon(s:get_ale_counts().error, g:ale_icons.circle)
      endfunction

      function! g:LightLineAleWarning() abort
        return LightLineFormatAleIcon(s:get_ale_counts().warning, g:ale_icons.triangle)
      endfunction

      function! g:LightLinePercent() abort
        return &filetype !~? 'Mundo\|MundoDiff' ? printf('%3d%%', (100 * line('.') / line('$'))) : ''
      endfunction

      function! g:LightLineLineInfo() abort
        return &filetype !~? 'Mundo\|MundoDiff' ? printf('%3d %3d', line('.'), col('.')) : ''
      endfunction

      function! g:LightLineFileEncoding() abort
        return strlen(&fileencoding) > 0 && &filetype !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug' ? &fileencoding : ''
      endfunction

      function! g:LightLineFileFormat() abort
        return strlen(&fileformat) > 0 && &filetype !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug' && expand('%:t') !=# 'ControlP' ? &fileformat : ''
      endfunction

      function! g:LightLineFileType() abort
        return strlen(&filetype) > 0 && &filetype !~? 'help\|Mundo\|MundoDiff\|qf\|vim-plug' ? &filetype : ''
      endfunction

    " }
    " ALE integration {

      augroup UpdateLightLineWhenALELints
        autocmd!
        autocmd User ALEFixPost call lightline#update()
        autocmd User ALEJobStarted call lightline#update()
        autocmd User ALELintPost call lightline#update()
      augroup END

    " }
    " reload on colorscheme change {

      function! s:reload_lightline() abort
        if !exists('g:loaded_lightline')
          return
        endif

        for l:theme in split(globpath(g:themes_dir . '/plugin/lightline/colorscheme', '*.vim'), '\n')
          exe 'source' fnameescape(l:theme)
        endfor

        let g:lightline.colorscheme = g:colors_name
        call lightline#enable()
      endfunction

      augroup ReloadLightLineWhenColorSchemeChanges
        autocmd!
        autocmd ColorScheme * call s:reload_lightline()
      augroup END

    " }
  " }
  " neoformat {

    nnoremap <silent> <Leader>f :Neoformat<CR>

  " }
  " netrw {

    let g:netrw_banner = 0
    let g:netrw_home = s:state_dir . '/netrw'
    let g:netrw_localcopycmd = 'copy'

    noremap <silent> <Leader>e :Explore<CR>

  " }
  " typescript-vim {

    let g:typescript_compiler_binary = 'tsc'
    let g:typescript_compiler_options = ''

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
  " vim-gruvbox8 {

    let g:gruvbox_italics = 0
    let g:gruvbox_italicize_strings = 0

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
  " vim-solarized8 {

    let g:solarized_italics = 0

  " }
" }
" colorscheme {

  function! s:hide_tilde_on_empty_lines() abort
    highlight EndOfBuffer guifg=BG
  endfunction

  augroup HideTildeOnEmptyLinesWhenColorSchemeChanges
    autocmd!
    autocmd ColorScheme * call s:hide_tilde_on_empty_lines()
  augroup END

  function! s:apply_background() abort
    exe 'set background=' . s:get_current_background()
  endfunction

  function! s:apply_colorscheme() abort
    exe 'colorscheme' fnameescape(s:get_current_color_scheme())
  endfunction

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

  function! s:cycle_color_schemes() abort
    let g:THEME.colorscheme = g:THEME.colorscheme == len(s:themes) - 1 ? 0 : g:THEME.colorscheme + 1
    call s:apply_colorscheme()
  endfunction

  nnoremap <silent> <Leader>c :call <sid>cycle_color_schemes()<CR>

  function! s:toggle_background() abort
    let g:THEME.background = g:THEME.background ==# 'dark' ? 'light' : 'dark'
    call s:apply_background()
  endfunction

  nnoremap <silent> <Leader>b :call <sid>toggle_background()<CR>

  call s:apply_background()
  call s:apply_colorscheme()

" }
" terminal {

  if s:vim && s:windows
    nnoremap <Leader>t :botright terminal ++close pwsh --nologo<CR>
  endif

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
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &filetype !~# 'commit' | exe "normal! g`\"" | endif
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

  vnoremap <BS> d

  noremap <C-A> ggVG

  if has('clipboard')

    vnoremap <C-C> "+y
    vnoremap <C-X> "+x

    map <C-V> "+gP
    cmap <C-V> <C-R>+
    exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

  endif

  noremap <C-Q> <C-V>

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

  function! s:toggle_list(kind, prefix) abort
    redir => l:buffers
    silent! buffers
    redir END
    exe a:prefix . (l:buffers =~# '\[' . a:kind . ' List\]' ? 'close' : 'open')
  endfunction

  nnoremap <silent> <Leader>l :call <sid>toggle_list('Location', 'l')<CR>
  nnoremap <silent> <Leader>q :call <sid>toggle_list('Quickfix', 'c')<CR>

" }
" diff and merge {

  augroup KeepWindowSizesEqualWhenResizingInDiffMode
    autocmd!
    autocmd VimResized * if &diff | wincmd = | endif
  augroup END

  function! s:vim_diff() abort
    let s:ft = &filetype
    windo if (winnr() != 1 && &ft == '') | :silent! exe 'set ft=' . s:ft | endif
    wincmd =
  endfunction

  command! VimDiff call <sid>vim_diff()

  function! s:vim_merge() abort
    let s:ft = &filetype
    windo if (winnr() != 1 && &ft == '') | :silent! exe 'set ft=' . s:ft | endif
    wincmd b
    wincmd J
    if search('') > 0 | :e ++fileformat=dos | endif
    diffupdate
  endfunction

  command! VimMerge call <sid>vim_merge()

  command! -nargs=* DiffGet :diffget <args> | :diffupdate
  nnoremap <silent> <Leader>d1 :DiffGet 1<CR>
  nnoremap <silent> <Leader>d2 :DiffGet 2<CR>
  nnoremap <silent> <Leader>d3 :DiffGet 3<CR>

  command! -nargs=* DiffPut :diffput <args> | :diffupdate
  nnoremap <silent> <Leader>d4 :DiffPut 4<CR>

" }

