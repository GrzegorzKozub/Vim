let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {} }

function! s:GetGruvboxColor(group)
    return synIDattr(hlID(a:group), 'fg', 'gui') 
endfunction

let s:bg0    = s:GetGruvboxColor('GruvboxBg0')
let s:bg1    = s:GetGruvboxColor('GruvboxBg1')
let s:bg3    = s:GetGruvboxColor('GruvboxBg3')

let s:blue   = s:GetGruvboxColor('GruvboxBlue')
let s:gray   = s:GetGruvboxColor('GruvboxGray')
let s:green  = s:GetGruvboxColor('GruvboxGreen')
let s:orange = s:GetGruvboxColor('GruvboxOrange')
let s:red    = s:GetGruvboxColor('GruvboxRed')
let s:yellow = s:GetGruvboxColor('GruvboxYellow')

let s:p.normal.left     = [ [ s:bg0, s:gray ], [ s:bg0, s:bg3 ] ]
let s:p.normal.middle   = [ [ s:gray, s:bg1 ] ]
let s:p.normal.right    = s:p.normal.left

let s:p.inactive.left   = [ [ s:bg3, s:bg1 ], [ s:bg3, s:bg1 ] ]
let s:p.inactive.middle = s:p.inactive.left
let s:p.inactive.right  = s:p.inactive.left

let s:p.insert.left     = [ [ s:bg0, s:blue ], [ s:bg0, s:bg3 ] ]
let s:p.replace.left    = [ [ s:bg0, s:orange ], [ s:bg0, s:bg3 ] ]
let s:p.visual.left     = [ [ s:bg0, s:green ], [ s:bg0, s:bg3 ] ]

let s:p.normal.error    = [ [ s:bg0, s:red ] ]
let s:p.normal.warning  = [ [ s:bg0, s:yellow ] ]

let g:lightline#colorscheme#gruvbox#palette = lightline#colorscheme#fill(s:p)
