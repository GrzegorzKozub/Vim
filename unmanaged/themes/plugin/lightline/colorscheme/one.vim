let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {} }

if &background ==# 'light'

    let s:mono_3        = '#a0a1a7'
    let s:mono_4        = '#c2c2c3'

    let s:hue_1         = '#0184bc' " cyan
    let s:hue_4         = '#50a14f' " green
    let s:hue_5         = '#e45649' " red 1
    let s:hue_6_2       = '#c18401' " orange 2

    let s:syntax_bg     = '#fafafa'
    let s:syntax_cursor = '#f0f0f0'

    let s:p.normal.left    = [ [ s:syntax_bg, s:mono_3 ], [ s:syntax_bg, s:mono_4 ] ]
    let s:p.normal.middle  = [ [ s:mono_3, s:syntax_bg ] ]

    let s:p.inactive.left  = [ [ s:mono_4, s:syntax_bg ], [ s:mono_4, s:syntax_bg ] ]

    let s:p.insert.left    = [ [ s:syntax_bg, s:hue_1 ], [ s:syntax_bg, s:mono_4 ] ]
    let s:p.replace.left   = [ [ s:syntax_bg, s:hue_5 ], [ s:syntax_bg, s:mono_4 ] ]
    let s:p.visual.left    = [ [ s:syntax_bg, s:hue_4 ], [ s:syntax_bg, s:mono_4 ] ]

    let s:p.normal.error   = [ [ s:syntax_bg, s:hue_5 ] ]
    let s:p.normal.warning = [ [ s:syntax_bg, s:hue_6_2 ] ]

else

    let s:mono_2        = '#828997'
    let s:mono_3        = '#5c6370'

    let s:hue_1         = '#56b6c2' " cyan
    let s:hue_4         = '#98c379' " green
    let s:hue_5_2       = '#be5046' " red 2
    let s:hue_6         = '#d19a66' " orange 1

    let s:syntax_bg     = '#282c34'
    let s:syntax_cursor = '#2c323c'

    let s:p.normal.left    = [ [ s:syntax_bg, s:mono_2 ], [ s:syntax_bg, s:mono_3 ] ]
    let s:p.normal.middle  = [ [ s:mono_3, s:syntax_bg ] ]

    let s:p.inactive.left  = [ [ s:mono_3, s:syntax_bg ], [ s:mono_3, s:syntax_bg ] ]

    let s:p.insert.left    = [ [ s:syntax_bg, s:hue_1 ], [ s:syntax_bg, s:mono_3 ] ]
    let s:p.replace.left   = [ [ s:syntax_bg, s:hue_5_2 ], [ s:syntax_bg, s:mono_3 ] ]
    let s:p.visual.left    = [ [ s:syntax_bg, s:hue_4 ], [ s:syntax_bg, s:mono_3 ] ]

    let s:p.normal.error   = [ [ s:syntax_bg, s:hue_5_2 ] ]
    let s:p.normal.warning = [ [ s:syntax_bg, s:hue_6 ] ]

endif

let s:p.normal.right = s:p.normal.left

let s:p.inactive.middle = s:p.inactive.left
let s:p.inactive.right = s:p.inactive.left

let s:p.insert.right = s:p.normal.right
let s:p.replace.right = s:p.normal.right
let s:p.visual.right = s:p.normal.right

let g:lightline#colorscheme#one#palette = lightline#colorscheme#fill(s:p)

