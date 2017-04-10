let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {} }

let s:base03  = '#002b36'
let s:base02  = '#073642'
let s:base01  = '#586e75'
let s:base00  = '#657b83'
let s:base0   = '#839496'
let s:base1   = '#93a1a1'
let s:base2   = '#eee8d5'
let s:base3   = '#fdf6e3'

let s:blue    = '#268bd2'
let s:green   = '#859900'
let s:orange  = '#cb4b16'
let s:red     = '#dc322f'
let s:yellow  = '#b58900'

if &background ==# 'light'
  let [ s:base03, s:base3 ] = [ s:base3, s:base03 ]
  let [ s:base02, s:base2 ] = [ s:base2, s:base02 ]
  let [ s:base01, s:base1 ] = [ s:base1, s:base01 ]
  let [ s:base00, s:base0 ] = [ s:base0, s:base00 ]
endif

let s:p.normal.left     = [ [ s:base03, s:base00 ], [ s:base03, s:base01 ] ]
let s:p.normal.middle   = [ [ s:base00, s:base02 ] ]
let s:p.normal.right    = s:p.normal.left

let s:p.inactive.left   = [ [ s:base01, s:base02 ], [ s:base01, s:base02 ] ]
let s:p.inactive.middle = s:p.inactive.left
let s:p.inactive.right  = s:p.inactive.left

let s:p.insert.left     = [ [ s:base03, s:blue ], [ s:base03, s:base01 ] ]
let s:p.replace.left    = [ [ s:base03, s:orange ], [ s:base03, s:base01 ] ]
let s:p.visual.left     = [ [ s:base03, s:green ], [ s:base03, s:base01 ] ]

let s:p.normal.error    = [ [ s:base03, s:red ] ]
let s:p.normal.warning  = [ [ s:base03, s:yellow ] ]

let g:lightline#colorscheme#solarized#palette = lightline#colorscheme#fill(s:p)

