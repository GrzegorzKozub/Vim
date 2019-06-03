if &background ==# 'dark'
  let s:hue_2     = '#61afef' " blue
  let s:hue_4     = '#98c379' " green
  let s:hue_5     = '#e06c75' " red 1
  let s:hue_6_2   = '#e5c07b' " orange 2
  let s:mono_3    = '#5c6370'
  let s:syntax_bg = '#282c34'
else
  let s:hue_2     = '#4078f2' " blue
  let s:hue_4     = '#50a14f' " green
  let s:hue_5     = '#e45649' " red 1
  let s:hue_6_2   = '#c18401' " orange 2
  let s:mono_3    = '#a0a1a7'
  let s:syntax_bg = '#fafafa'
endif

exec 'hi SignColumn guibg=' . s:syntax_bg
exec 'hi StatusLine guibg=' . s:syntax_bg
exec 'hi StatusLineNC guifg=' . s:syntax_bg
exec 'hi Todo guifg=' . s:mono_3
exec 'hi VertSplit guifg=' . s:syntax_bg

hi DiffDelete gui=NONE
hi DiffText gui=NONE cterm=NONE
hi Error gui=NONE cterm=NONE
hi helpHeader gui=NONE cterm=NONE
hi MatchParen gui=NONE cterm=NONE
hi ModeMsg gui=NONE cterm=NONE
hi MoreMsg gui=NONE
hi Question gui=NONE
hi Title gui=NONE cterm=NONE
hi Underlined gui=NONE cterm=NONE
hi vimCommentTitle gui=NONE cterm=NONE

