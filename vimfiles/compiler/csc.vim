if exists("current_compiler")
    finish
endif

let current_compiler = "csc"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=\ %#%f(%l\\\,%c):\ %m
CompilerSet makeprg=\"\"c:\\Program\ Files\ (x86)\\Microsoft\ Visual\ Studio\ 10.0\\VC\\vcvarsall.bat\"\ >\ NUL\ \&\ csc\ /nologo\ %\"
