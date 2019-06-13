let s:nord0_gui  = '#2E3440'
let s:nord1_gui  = '#3B4252'
let s:nord2_gui  = '#434C5E'
let s:nord3_gui  = '#616E88'
let s:nord4_gui  = '#D8DEE9'
let s:nord5_gui  = '#E5E9F0'
let s:nord6_gui  = '#ECEFF4'
let s:nord7_gui  = '#8FBCBB'
let s:nord8_gui  = '#88C0D0'
let s:nord9_gui  = '#81A1C1'
let s:nord10_gui = '#5E81AC' " blue
let s:nord11_gui = '#BF616A' " red
let s:nord12_gui = '#D08770' " orange
let s:nord13_gui = '#EBCB8B' " yellow
let s:nord14_gui = '#A3BE8C' " green
let s:nord15_gui = '#B48EAD' " purple

exec 'hi Error guifg=' . s:nord11_gui . ' guibg=' . s:nord0_gui
exec 'hi ErrorMsg guifg=' . s:nord11_gui . ' guibg=' . s:nord0_gui
exec 'hi StatusLineNC guibg=' . s:nord0_gui
exec 'hi Todo guifg=' . s:nord3_gui
exec 'hi WarningMsg guifg=' . s:nord13_gui . ' guibg=' . s:nord0_gui

hi CursorLineNr gui=NONE cterm=NONE
hi Statement gui=NONE cterm=NONE
hi Question gui=NONE cterm=NONE
