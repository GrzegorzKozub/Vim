" vim: set foldmarker={,} foldmethod=marker :

scriptencoding 'utf-8'

" platform {

let s:windows = has('win32')
let s:linux = !s:windows

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

" }
" gui {

"if s:windows
  "set renderoptions=type:directx,gamma:1.8,contrast:0.5,level:0.5,geom:1,renmode:5,taamode:1
"endif

if s:windows

  set guifont=Fira\ Code\ Retina:h12

  let s:screen = eval(vimdows#get_screen())

  if s:screen.height == 2160 && s:screen.dpi == 144
      set columns=120 lines=42
      winpos 1918 400
  elseif s:screen.height == 2400 && s:screen.dpi == 240
      set columns=100 lines=35
      winpos 1208 249
  endif

endif

" }

