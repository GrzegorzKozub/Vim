hi clear Normal

set bg&

hi clear

if exists("syntax_on")
	syntax reset
endif

hi Boolean			cterm=None						ctermfg=Magenta		gui=None					guifg=#8000FF
hi Character		cterm=None						ctermfg=DarkCyan	gui=None					guifg=#008080
hi Comment			cterm=None						ctermfg=DarkGray	gui=Italic					guifg=#A0A0A0
hi Conditional		cterm=None						ctermfg=Cyan		gui=None					guifg=#0080C0
hi Constant			cterm=None						ctermfg=Magenta		gui=None					guifg=#8000FF
hi Cursor			cterm=None	ctermbg=Gray		ctermfg=White		gui=None	guibg=#808080	guifg=#FFFFFF
"hi CursorColumn
hi CursorLine																		guibg=#FFFFFF
"hi Debug
hi Comment			cterm=None						ctermfg=DarkGray	gui=Italic					guifg=#A0A0A0
hi Conditional		cterm=None						ctermfg=Cyan		gui=None					guifg=#0080C0
hi Constant			cterm=None						ctermfg=Magenta		gui=None					guifg=#8000FF
hi Cursor			cterm=None	ctermbg=Gray		ctermfg=White		gui=None	guibg=#808080	guifg=#FFFFFF
"hi CursorColumn
hi CursorLine																		guibg=#FFFFFF	
"hi Debug
hi Define			cterm=None						ctermfg=Yellow		gui=None					guifg=#7F7F00
"hi Delimiter
hi DiffAdd			cterm=None	ctermbg=DarkGreen						gui=None	guibg=#80FF80
hi DiffChange		cterm=None	ctermbg=Blue							gui=None	guibg=#A0C0FF
hi DiffDelete		cterm=None	ctermbg=Red			ctermfg=Red			gui=None	guibg=#FFBFBF	guifg=#FFBFBF
hi DiffText			cterm=None	ctermbg=Yellow							gui=None	guibg=#FFFF80
"hi Directory
hi Error			cterm=None	ctermbg=Red			ctermfg=DarkRed		gui=None	guibg=#FFBFBF	guifg=#FF0000
hi ErrorMsg			cterm=None	ctermbg=None		ctermfg=Red			gui=Bold	guibg=#F7F7F7	guifg=#FF0000
hi Exception		cterm=None						ctermfg=Cyan		gui=None					guifg=#0080C0
hi Float			cterm=None						ctermfg=Red			gui=None					guifg=#FF0080
hi FoldColumn		cterm=None	ctermbg=DarkGray	ctermfg=Gray		gui=None	guibg=#C0C0C0	guifg=#808080
hi Folded     		cterm=None	ctermbg=DarkGray	ctermfg=Gray		gui=None	guibg=#C0C0C0	guifg=#F7F7F7
hi Function			cterm=None						ctermfg=DarkRed		gui=None					guifg=#804040
hi Identifier		cterm=None						ctermfg=DarkRed		gui=None					guifg=#804000
"hi Ignore
hi Include			cterm=None						ctermfg=Yellow		gui=None					guifg=#7F7F00
hi IncSearch		cterm=None	ctermbg=DarkGray	ctermfg=Yellow		gui=Bold	guibg=#C0C0C0	guifg=#FFFF80
hi Keyword			cterm=None						ctermfg=Cyan		gui=None					guifg=#8080C0
"hi Label
"hi lCursor	
hi LineNr			cterm=None	ctermbg=DarkGray	ctermfg=Black		gui=None	guibg=#C0C0C0	guifg=#808080
"hi Macro
hi MatchParen		cterm=None	ctermbg=Yellow		ctermfg=Blue		gui=None	guibg=#FFFF80	guifg=#0000FF
hi ModeMsg			cterm=None	ctermbg=None							gui=Bold	guibg=#F7F7F7	guifg=#808080
hi MoreMsg			cterm=None	ctermbg=None							gui=Bold	guibg=#F7F7F7	guifg=#808080
hi NonText			cterm=None						ctermfg=DarkGray	gui=None					guifg=#C0C0C0
hi Normal																			guibg=#F7F7F7
hi Number			cterm=None						ctermfg=Magenta		gui=None					guifg=#C07F5F
"hi Operator
"hi Pmenu
"hi PmenuSbar
"hi PmenuSel
"hi PmenuThumb
"hi PreCondit
hi PreProc			cterm=None						ctermfg=Yellow		gui=None					guifg=#7F7F00
hi Question			cterm=None	ctermbg=None		ctermfg=DarkGreen	gui=Bold	guibg=#F7F7F7	guifg=#408080
hi Repeat			cterm=None						ctermfg=Blue		gui=None					guifg=#0000FF
hi Search			cterm=None	ctermbg=DarkGray	ctermfg=White		gui=None	guibg=#C0C0C0	guifg=#FFFFFF
"hi SignColumn
hi Special			cterm=None						ctermfg=DarkGreen	gui=None					guifg=#800080
"hi SpecialChar
"hi SpecialComment
hi SpecialKey		cterm=None						ctermfg=DarkGray	gui=None					guifg=#C0C0C0
hi SpellBad			cterm=None	ctermbg=DarkMagenta						gui=Undercurl								guisp=#FF0000
hi SpellCap			cterm=None	ctermbg=DarkMagenta						gui=Undercurl								guisp=#0000FF
hi SpellLocal		cterm=None	ctermbg=DarkMagenta						gui=Undercurl								guisp=#00FFFF
hi SpellRare		cterm=None	ctermbg=DarkMagenta						gui=Undercurl								guisp=#FF00FF
hi Statement		cterm=None						ctermfg=Cyan		gui=None					guifg=#0080C0
hi StatusLine															gui=Bold	guibg=#979797	guifg=#FFFFFF
hi StatusLineNC															gui=None	guibg=#C0C0C0	guifg=#F7F7F7
"hi StorageClass
hi String			cterm=None						ctermfg=Green		gui=None					guifg=#00C000
"hi Structure
"hi TabLine
"hi TabLineFill
"hi TabLineSel
"hi Tag
hi Title			cterm=None	ctermbg=None		ctermfg=DarkBlue	gui=None	guibg=#F7F7F7	guifg=#004080
hi Todo				cterm=None	ctermbg=None		ctermfg=Magenta		gui=Italic	guibg=#F7F7F7	guifg=#FF80C0
hi Type				cterm=None						ctermfg=White		gui=None					guifg=#8080FF
"hi Typedef
hi Underlined		cterm=None	ctermbg=None		ctermfg=Blue		gui=None	guibg=#F7F7F7	guifg=#0000FF
hi VertSplit		cterm=None	ctermbg=None		ctermfg=Gray		gui=None	guibg=#F7F7F7	guifg=#C0C0C0
hi Visual			cterm=None	ctermbg=DarkBlue									guibg=#BFBFDF	
"hi VisualNOS 
hi WarningMsg		cterm=None	ctermbg=None		ctermfg=DarkYellow	gui=Bold	guibg=#F7F7F7	guifg=#808000
"hi WildMenu

let colors_name = "grzegorz"

