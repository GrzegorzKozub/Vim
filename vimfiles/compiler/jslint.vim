if exists("current_compiler")
    finish
endif

let current_compiler = "jslint"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%-P%f,%E%>\ #%n\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,%-G%f\ is\ OK.,%-Q
CompilerSet makeprg=jslint\ %
