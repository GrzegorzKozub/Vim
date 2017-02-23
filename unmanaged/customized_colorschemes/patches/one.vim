if &background ==# 'dark'
    let s:hue_2     = '#61afef' " blue
    let s:hue_4     = '#98c379' " green
    let s:hue_5     = '#e06c75' " red 1
    let s:hue_6_2   = '#e5c07b' " orange 2
    let s:syntax_bg = '#282c34' 
else
    let s:hue_2     = '#4078f2' " blue
    let s:hue_4     = '#50a14f' " green
    let s:hue_5     = '#e45649' " red 1
    let s:hue_6_2   = '#c18401' " orange 2
    let s:syntax_bg = '#fafafa'
endif

exec 'hi SignColumn guibg=' . s:syntax_bg
exec 'hi Todo guifg=' . s:hue_6_2
exec 'hi VertSplit guifg=' . s:syntax_bg

hi Error gui=NONE
hi Title gui=NONE
hi vimCommentTitle gui=NONE

" vim-gitgutter
exec 'hi GitGutterAdd guifg=' . s:hue_4
exec 'hi GitGutterChange guifg=' . s:hue_2
exec 'hi GitGutterChangeDelete guifg=' . s:hue_2
exec 'hi GitGutterDelete guifg=' . s:hue_5
