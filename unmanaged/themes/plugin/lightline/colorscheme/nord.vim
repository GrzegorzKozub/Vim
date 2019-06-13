let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {} }

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

let s:p.normal.left     = [ [ s:nord0_gui, s:nord3_gui ], [ s:nord0_gui, s:nord2_gui ] ]
let s:p.normal.middle   = [ [ s:nord3_gui, s:nord0_gui ] ]
let s:p.normal.right    = s:p.normal.left

let s:p.inactive.left   = [ [ s:nord3_gui, s:nord0_gui ], [ s:nord3_gui, s:nord0_gui ] ]
let s:p.inactive.middle = s:p.inactive.left
let s:p.inactive.right  = s:p.inactive.left

let s:p.insert.left     = [ [ s:nord0_gui, s:nord10_gui ], [ s:nord0_gui, s:nord2_gui ] ]
let s:p.replace.left    = [ [ s:nord0_gui, s:nord12_gui ], [ s:nord0_gui, s:nord2_gui ] ]
let s:p.visual.left     = [ [ s:nord0_gui, s:nord14_gui ], [ s:nord0_gui, s:nord2_gui ] ]

let s:p.normal.error    = [ [ s:nord0_gui, s:nord11_gui ] ]
let s:p.normal.warning  = [ [ s:nord0_gui, s:nord13_gui ] ]

let g:lightline#colorscheme#nord#palette = lightline#colorscheme#fill(s:p)

