let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {} }

let s:nord0  = '#2E3440'
let s:nord1  = '#3B4252'
let s:nord2  = '#434C5E'
let s:nord3  = '#4C566A'
let s:nord4  = '#D8DEE9'
let s:nord5  = '#E5E9F0'
let s:nord6  = '#ECEFF4'
let s:nord7  = '#8FBCBB'
let s:nord8  = '#88C0D0'
let s:nord9  = '#81A1C1'
let s:nord10 = '#5E81AC'
let s:nord11 = '#BF616A'
let s:nord12 = '#D08770'
let s:nord13 = '#EBCB8B'
let s:nord14 = '#A3BE8C'
let s:nord15 = '#B48EAD'

let s:p.normal.left     = [ [ s:nord0, s:nord3 ], [ s:nord0, s:nord2 ] ]
let s:p.normal.middle   = [ [ s:nord3, s:nord1 ] ]
let s:p.normal.right    = [ [ s:nord0, s:nord3 ], [ s:nord0, s:nord2 ] ]

let s:p.inactive.left   = [ [ s:nord3, s:nord1 ], [ s:nord3, s:nord1 ] ]
let s:p.inactive.middle = [ [ s:nord3, s:nord1 ] ]
let s:p.inactive.right  = [ [ s:nord3, s:nord1 ], [ s:nord3, s:nord1 ] ]

let s:p.insert.left     = [ [ s:nord0, s:nord9 ], [ s:nord0, s:nord2 ] ]
let s:p.replace.left    = [ [ s:nord0, s:nord12 ], [ s:nord0, s:nord2 ] ]
let s:p.visual.left     = [ [ s:nord0, s:nord14 ], [ s:nord0, s:nord2 ] ]

let s:p.normal.warning  = [ [ s:nord0, s:nord13 ] ]
let s:p.normal.error    = [ [ s:nord0, s:nord11 ] ]

let g:lightline#colorscheme#nord#palette = lightline#colorscheme#fill(s:p)

