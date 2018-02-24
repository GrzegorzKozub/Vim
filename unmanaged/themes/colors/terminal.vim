set background=light
hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'terminal'

hi CursorLine ctermfg=White ctermbg=DarkGray
hi CursorLineNr ctermfg=Gray
hi Error ctermfg=DarkRed ctermbg=BG
hi ErrorMsg ctermfg=DarkRed ctermbg=NONE
hi Folded ctermbg=Black
hi IncSearch ctermbg=Yellow
hi LineNr ctermfg=DarkGray
hi MatchParen ctermfg=Gray ctermbg=DarkGray
hi NonText ctermfg=DarkGray
hi SignColumn ctermbg=BG
hi Todo ctermfg=DarkYellow ctermbg=BG
hi Underlined cterm=NONE
hi VertSplit ctermbg=BG

" vim-gitgutter
hi GitGutterAdd ctermfg=DarkGreen
hi GitGutterChange ctermfg=DarkBlue
hi GitGutterChangeDelete ctermfg=DarkBlue
hi GitGutterDelete ctermfg=DarkRed

