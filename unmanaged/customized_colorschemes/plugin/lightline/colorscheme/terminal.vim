let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {} }

let s:black      = [ '#404040', 0 ]
let s:darkcyan   = [ '#80c0c0', 3 ]
let s:darkgray   = [ '#808080', 8 ]
let s:darkgreen  = [ '#80c080', 2 ]
let s:darkred    = [ '#c08080', 4 ]
let s:darkyellow = [ '#c0c080', 6 ]
let s:gray       = [ '#c0c0c0', 7 ]

let s:p.normal.left     = [ [ s:black, s:gray ], [ s:black, s:darkgray ] ]
let s:p.normal.middle   = [ [ s:gray, s:black ] ]
let s:p.normal.right    = [ [ s:black, s:gray ], [ s:black, s:darkgray ] ]

let s:p.inactive.right  = [ [ s:darkgray, s:black ], [ s:darkgray, s:black ] ]
let s:p.inactive.middle = [ [ s:darkgray, s:black ] ]
let s:p.inactive.left   = [ [ s:darkgray, s:black ], [ s:darkgray, s:black ] ]

let s:p.insert.left     = [ [ s:black, s:darkcyan ], [ s:black, s:darkgray ] ]
let s:p.replace.left    = [ [ s:black, s:darkred ], [ s:black, s:darkgray ] ]
let s:p.visual.left     = [ [ s:black, s:darkgreen ], [ s:black, s:darkgray ] ]

let s:p.normal.error    = [ [ s:black, s:darkred ] ]
let s:p.normal.warning  = [ [ s:black, s:darkyellow ] ]

let g:lightline#colorscheme#terminal#palette = lightline#colorscheme#flatten(s:p)
