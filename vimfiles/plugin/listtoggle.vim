command ListToggle call ListToggle()

function ListToggle()
    set list!
    if has("gui_running")
        if &list == "list"
            call HideTildeOnEmptyLines()
        else
            colorscheme solarized
            AirlineRefresh
        endif
    endif
endfunction

