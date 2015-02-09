if exists("current_compiler")
    finish
endif

let current_compiler = "jshint"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
CompilerSet makeprg=jshint\ %

