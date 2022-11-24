" vim: set foldmarker={,} foldmethod=marker :

" platform {

  let s:windows = has('win32')
  let s:linux = !s:windows

  let s:neovim = has('nvim')
  let s:vim = !s:neovim

" }
" settings {

  if s:windows
    set guioptions-=a
    set guioptions-=t
  endif

  set guioptions+=c
  set guioptions-=b
  set guioptions-=r
  set guioptions-=L
  set guioptions-=m
  set guioptions+=M
  set guioptions-=T
  set guitablabel=%t\ %M
  set linespace=0

  scriptencoding 'utf-8'

" }
" gui {

  "if s:vim && s:windows
    "set renderoptions=type:directx,gamma:1.8,contrast:0.5,level:0.5,geom:1,renmode:5,taamode:1
  "endif

  if s:neovim

    function! s:toggle_window_maximized() abort
      call GuiWindowMaximized(!g:GuiWindowMaximized)
    endfunction

    function! s:toggle_window_full_screen() abort
      call GuiWindowFullScreen(!g:GuiWindowFullScreen)
    endfunction

    nnoremap <silent> <F10> :call <sid>toggle_window_maximized()<CR>
    nnoremap <silent> <F11> :call <sid>toggle_window_full_screen()<CR>

  endif

  if s:windows

    if s:neovim

      function! s:set_window_position(left, top, width, height) abort
        if has('python3')
python3 << EOF
import vim, win32gui;
window = win32gui.GetForegroundWindow();
left, top, _right, _bottom = win32gui.GetWindowRect(window);
a_left = int(vim.eval('a:left')); a_top = int(vim.eval('a:top'));
tolerance = 10;
if left % a_left > tolerance or top % a_top > tolerance:
  win32gui.SetWindowPos(window, 0, a_left, a_top, int(vim.eval('a:width')), int(vim.eval('a:height')), 0);
EOF
          sleep 1m
        endif
      endfunction

    endif

    if s:neovim
      GuiFont Fira\ Code\ Retina:h12
      GuiRenderLigatures 1
    else
      set guifont=Fira\ Code\ Retina:h12
    endif

    let s:screen = eval(vimdows#get_screen())

    if s:screen.height == 2160 && s:screen.dpi == 144
      if s:vim
        set columns=120 lines=42
        winpos 1918 400
      else
        call s:set_window_position(1918, 400, 1822, 1274)
      endif
    elseif s:screen.height == 2400 && s:screen.dpi == 240
      if s:vim
        set columns=100 lines=35
        winpos 1208 249
      else
        call s:set_window_position(1208, 249, 2532, 1803)
      endif
    endif

  endif

" }

