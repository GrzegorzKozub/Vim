let s:neutralred    = '#CC241D'
let s:neutralgreen  = '#98971A'
let s:neutralyellow = '#D79921'
let s:neutralblue   = '#458588'
let s:neutralpurple = '#B16286'
let s:neutralaqua   = '#689D6A'
let s:neutralorange = '#D65D0E'

if &background ==# 'dark'
  let s:bg0    = '#282828'
  let s:bg1    = '#3C3836'
  let s:bg2    = '#514945'
  let s:bg3    = '#665C54'
  let s:bg4    = '#7C6F64'
  let s:fg0    = '#FBF1C7'
  let s:fg1    = '#EBDBB2'
  let s:fg2    = '#D5C4A1'
  let s:fg3    = '#BDAE93'
  let s:fg4    = '#A89984'
  let s:grey   = '#928374'
  let s:red    = '#FB4934'
  let s:green  = '#B8BB26'
  let s:yellow = '#FABD2F'
  let s:blue   = '#83A598'
  let s:purple = '#D3869B'
  let s:aqua   = '#8EC07C'
  let s:orange = '#FE8019'
else
  let s:bg0    = '#FBF1C7'
  let s:bg1    = '#EBDBB2'
  let s:bg2    = '#D5C4A1'
  let s:bg3    = '#BDAE93'
  let s:bg4    = '#A89984'
  let s:fg0    = '#282828'
  let s:fg1    = '#3C3836'
  let s:fg2    = '#503836'
  let s:fg3    = '#665C54'
  let s:fg4    = '#7C6F64'
  let s:grey   = '#928374'
  let s:red    = '#9D0006'
  let s:green  = '#79740E'
  let s:yellow = '#B57614'
  let s:blue   = '#076678'
  let s:purple = '#8F3F71'
  let s:aqua   = '#427B58'
  let s:orange = '#AF3A03'
endif

exec 'hi CursorLineNr guifg=' . s:bg4
exec 'hi ErrorMsg guifg=' . s:red . ' guibg=' . s:bg0 . ' gui=NONE cterm=NONE'
exec 'hi Folded guifg=' . s:bg4 . ' guibg=' . s:bg0
exec 'hi SignColumn guibg=' . s:bg0
exec 'hi SpecialKey guifg=' . s:green . ' gui=NONE cterm=NONE'
exec 'hi StatusLine guifg=' . s:bg4 . ' guibg=' . s:bg0 . ' gui=NONE cterm=NONE'
exec 'hi StatusLineNC guifg=' . s:bg0
exec 'hi Todo guifg=' . s:grey . ' gui=NONE cterm=NONE'
exec 'hi Visual guifg=NONE guibg=' . s:bg1 . ' gui=NONE cterm=NONE'
exec 'hi WildMenu guifg=' . s:fg1 . ' guibg=' . s:bg0 . ' gui=NONE cterm=NONE'

hi Error gui=NONE cterm=NONE
hi Function gui=NONE cterm=NONE
hi MatchParen gui=NONE cterm=NONE
hi NonText gui=NONE cterm=NONE
hi Question gui=NONE cterm=NONE
hi WarningMsg gui=NONE cterm=NONE
hi Title gui=NONE cterm=NONE

