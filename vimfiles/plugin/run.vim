command Run call Run()

function Run()
    if &ft == "autohotkey" || &ft == "html"
        ! %
    elseif &ft == "c" || &ft == "cs" || &ft == "cpp"
        ! %:r
    elseif &ft == "javascript"
        ! node %
    elseif &ft == "ps1"
        ! powershell -File %
    elseif &ft == "ruby"
        ! ruby %
    else
        echoerr "Don't know how to run this type of file."
    endif
endfunction

