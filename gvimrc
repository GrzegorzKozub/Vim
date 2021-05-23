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
    else
      set guifont=Fira\ Code\ Retina:h12
    endif

    let s:screen = eval(vimdows#get_screen())

    if s:screen.height == 2160 && s:screen.dpi == 192
      if s:vim
        set columns=124 lines=34
        winpos 1234 549
      else
        call s:set_window_position(1234, 549, 2506, 1431)
      endif
    elseif s:screen.height == 2160 && s:screen.dpi == 144
      if s:vim
        set columns=165 lines=48
        winpos 1143 452
      else
        call s:set_window_position(1143, 452, 2497, 1448)
      endif
    elseif s:screen.height == 1800 && s:screen.dpi == 240
      if s:vim
        set columns=122 lines=31
        winpos 59 46
      else
        call s:set_window_position(60, 62, 3080, 1576)
        call s:toggle_window_maximized()
      endif
    elseif s:screen.height == 1800 && s:screen.dpi == 192
      if s:vim
        set columns=123 lines=30
        winpos 614 349
      else
        call s:set_window_position(614, 349, 2486, 1271)
      endif
    endif

  endif

" }

