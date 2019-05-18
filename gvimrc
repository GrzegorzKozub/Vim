" vim: set foldmarker={,} foldmethod=marker :

" platform {

  let s:windows = has('win32')
  let s:linux = !s:windows

" }
" settings {

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

  scriptencoding 'utf-8'

" }
" gui {

  if s:windows
    "set renderoptions=type:directx,gamma:1.8,contrast:0.5,level:0.5,geom:1,renmode:5,taamode:1

    "let s:screen = eval(system('screen.exe'))
    let s:screen = eval(vimdows#get_screen())

    if s:screen.height == 1800 && s:screen.dpi == 240

      set guifont=Fira\ Code\ Retina:h13:qANTIALIASED
      set columns=117
      set lines=29
      winpos 63 66

    elseif s:screen.height == 2160 && s:screen.dpi == 192

      set guifont=Fira\ Code\ Retina:h13
      set columns=120
      set lines=33
      winpos 50 50

    else

      set guifont=Fira\ Code\ Retina:h13

    endif
  endif

  if s:linux

    set guifont=Fira\ Code\ Medium\ 12
    set columns=100
    set lines=25
    winpos 200 125

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

    " }
  " }
" }
" mappings {

  unmap <C-F>
  unmap <C-H>

" }

