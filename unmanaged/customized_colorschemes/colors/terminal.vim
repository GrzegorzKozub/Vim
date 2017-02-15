set background=light
hi clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'terminal'

hi CursorLine ctermfg=White ctermbg=DarkGray
hi CursorLineNr ctermfg=Gray
hi Error ctermfg=DarkRed ctermbg=bg
hi Folded ctermbg=Black
hi IncSearch ctermbg=Yellow
hi LineNr ctermfg=DarkGray
hi MatchParen ctermbg=White
hi NonText ctermfg=DarkGray
hi SignColumn ctermbg=bg
hi Todo ctermfg=DarkYellow ctermbg=bg
hi VertSplit ctermbg=bg
