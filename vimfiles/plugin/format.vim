command Format call Format()

function Format()
    if &ft == "html"
        :%! tidy -q -i --show-errors 0
    elseif &ft == "javascript" || $ft == "json"
        :%! python -mjson.tool
    elseif &ft == "xml"
        :%! xmllint --format --recover -
    else
        echoerr "Don't know how to format this type of file."
    endif
endfunction

