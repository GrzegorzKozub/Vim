if &background ==# 'dark'
    let s:hue_6_2   = '#e5c07b' " orange 2
    let s:syntax_bg = '#282c34'
else
    let s:hue_6_2   = '#c18401' " orange 2
    let s:syntax_bg = '#fafafa'
endif

exec 'hi SignColumn guibg=' . s:syntax_bg
exec 'hi Todo guifg=' . s:hue_6_2
exec 'hi VertSplit guifg=' . s:syntax_bg

hi Error gui=NONE
hi Title gui=NONE
hi vimCommentTitle gui=NONE

