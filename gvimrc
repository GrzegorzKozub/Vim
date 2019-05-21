" vim: set foldmarker={,} foldmethod=marker :

" platform {

  let s:windows = has('win32')
  let s:linux = !s:windows

  let s:neovim = has('nvim')
  let s:vim = !s:neovim

" }
" settings {

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

    function! s:set_window_position(left, top, width, height) abort
python3 << EOF
import vim;
from ctypes import *;
user32 = WinDLL('user32.dll');
user32.SetWindowPos(user32.GetForegroundWindow(), 0, int(vim.eval('a:left')), int(vim.eval('a:top')), int(vim.eval('a:width')), int(vim.eval('a:height')), 0);
EOF
      sleep 1m
    endfunction

    set guifont=Fira\ Code\ Retina:h12
    let s:screen = eval(vimdows#get_screen())

    if s:screen.height == 1800 && s:screen.dpi == 240
      if s:vim
        set columns=127 lines=31
        winpos 60 62
      else
        call s:set_window_position(60, 62, 3080, 1576)
        call s:toggle_window_maximized()
      endif
    elseif s:screen.height == 2160 && s:screen.dpi == 192
      if s:vim
        set columns=131 lines=36
        winpos 50 50
      else
        call s:set_window_position(50, 50, 2515, 1439)
      endif
    endif
  else
    set guifont=Fira\ Code\ Medium\ 12
      if s:vim
        set columns=100 lines=25
        winpos 200 125
      else
        " todo: configure for neovim
      endif
  endif

" }
" icons {

  let g:icons.left_filled = ''
  let g:icons.right_filled = ''
  let g:icons.left_empty = ''
  let g:icons.right_empty = ''

  let g:icons.branch = ''
  let g:icons.padlock = ''

  let g:icons.space = ' '

" }
" plugins {
  " lightline.vim {
    " configuration {

      let g:lightline.separator = {
        \ 'left': g:icons.left_filled,
        \ 'right': g:icons.right_filled
      \ }

      let g:lightline.subseparator = {
        \ 'left': g:icons.left_empty,
        \ 'right': g:icons.right_empty
      \ }

      if s:neovim | call lightline#enable() | endif

    " }
  " }
" }
" mappings {

  if s:vim
    unmap <C-F>
    unmap <C-H>
  endif

" }

