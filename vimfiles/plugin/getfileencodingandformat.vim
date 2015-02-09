function GetFileEncodingAndFormat()
    let l:separator = ""
    if strlen(&fenc) > 0 && strlen(&ff) > 0
        let l:separator = get(w:, "airline_active", 0) ? " ⮃ " : "   "
    endif
    return printf("%s%s%s", &fenc, l:separator, &ff)
endfunction
