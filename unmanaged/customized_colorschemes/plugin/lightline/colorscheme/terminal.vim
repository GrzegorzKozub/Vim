let s:black = [ '#404040', 0 ]
let s:darkgreen = [ '#80c080', 2 ]
let s:darkcyan = [ '#80c0c0', 3 ]
let s:darkred = [ '#c08080', 4 ]
let s:darkyellow = [ '#c0c080', 6 ]
let s:gray = [ '#c0c0c0', 7 ]
let s:darkgray = [ '#808080', 8 ]

let s:palette = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {} }

let s:palette.normal.left = [ [ s:black, s:gray ], [ s:black, s:darkgray ] ]
let s:palette.normal.right = [ [ s:black, s:gray ], [ s:black, s:darkgray ] ]
let s:palette.inactive.right = [ [ s:darkgray, s:black ], [ s:darkgray, s:black ] ]
let s:palette.inactive.left = [ [ s:darkgray, s:black ], [ s:darkgray, s:black ] ]
let s:palette.insert.left = [ [ s:black, s:darkcyan ], [ s:black, s:darkgray ] ]
let s:palette.replace.left = [ [ s:black, s:darkred ], [ s:black, s:darkgray ] ]
let s:palette.visual.left = [ [ s:black, s:darkgreen ], [ s:black, s:darkgray ] ]
let s:palette.normal.middle = [ [ s:gray, s:black ] ]
let s:palette.inactive.middle = [ [ s:darkgray, s:black ] ]
let s:palette.normal.error = [ [ s:black, s:darkred ] ]
let s:palette.normal.warning = [ [ s:black, s:darkyellow ] ]

let g:lightline#colorscheme#terminal#palette = lightline#colorscheme#flatten(s:palette)
