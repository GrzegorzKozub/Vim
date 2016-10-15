function AirlineThemePatch(palette)
    let a:palette.accents.none = [ "", "", "", "" ]

    if g:airline_theme == "solarized"

        let l:base03 = "#002b36"
        let l:base02 = "#073642"
        let l:base01 = "#586e75"
        let l:base00 = "#657b83"
        let l:base0 = "#839496"
        let l:base1 = "#93a1a1"
        let l:base2 = "#eee8d5"
        let l:base3 = "#fdf6e3"

        let l:yellow = "#b58900"
        let l:orange = "#cb4b16"
        let l:red = "#dc322f"
        let l:magenta = "#d33682"
        let l:violet = "#6c71c4"
        let l:blue = "#268bd2"
        let l:cyan = "#2aa198"
        let l:green = "#859900"

        let l:normal = a:palette.normal
        let l:normal_modified = a:palette.normal_modified
        let l:insert = a:palette.insert
        let l:insert_modified = a:palette.insert_modified
        let l:replace = a:palette.replace
        let l:replace_modified = a:palette.replace_modified
        let l:visual = a:palette.visual
        let l:visual_modified = a:palette.visual_modified
        let l:inactive = a:palette.inactive
        let l:inactive_modified = a:palette.inactive_modified

        let l:normal.airline_a[1] = l:blue
        let l:insert.airline_a[1] = l:violet
        let l:visual.airline_a[1] = l:cyan

        let l:normal.airline_warning[1] = l:yellow

        let l:normal.airline_error[1] = l:red
        let l:normal_modified.airline_error[1] = l:red
        let l:insert.airline_error[1] = l:red
        let l:insert_modified.airline_error[1] = l:red
        let l:replace.airline_error[1] = l:red
        let l:replace_modified.airline_error[1] = l:red
        let l:visual.airline_error[1] = l:red
        let l:visual_modified.airline_error[1] = l:red

        if &background == "light"
            let l:inactive.airline_a[1] = l:base0

            let l:insert.airline_b[1] = l:base0
            let l:replace.airline_b[1] = l:base0
            let l:inactive.airline_b[1] = l:base1

            let l:insert.airline_c[0] = l:base0
            let l:replace.airline_c[0] = l:base0
            let l:inactive.airline_c[0] = l:base1
            let l:inactive.airline_c[1] = l:base2
            let l:inactive_modified.airline_c[0] = l:base0

            let l:insert.airline_x[0] = l:base0
            let l:replace.airline_x[0] = l:base0
            let l:inactive.airline_x[0] = l:base1
            let l:inactive.airline_x[1] = l:base2

            let l:insert.airline_y[1] = l:base0
            let l:replace.airline_y[1] = l:base0
            let l:inactive.airline_y[0] = l:base1
            let l:inactive.airline_y[1] = l:base2

            let l:normal.airline_z[1] = l:base0
            let l:insert.airline_z[1] = l:base00
            let l:replace.airline_z[1] = l:base00
            let l:visual.airline_z[1] = l:base0
            let l:inactive.airline_z[0] = l:base1
            let l:inactive.airline_z[1] = l:base2

            let l:normal.airline_warning[0] = l:base2

            let l:normal.airline_error[0] = l:base2
            let l:normal_modified.airline_error[0] = l:base2
            let l:insert.airline_error[0] = l:base2
            let l:insert_modified.airline_error[0] = l:base2
            let l:replace.airline_error[0] = l:base2
            let l:replace_modified.airline_error[0] = l:base2
            let l:visual.airline_error[0] = l:base2
            let l:visual_modified.airline_error[0] = l:base2
        endif

        if &background == "dark"
            let l:normal.airline_a[0] = l:base02
            let l:insert.airline_a[0] = l:base02
            let l:replace.airline_a[0] = l:base02
            let l:visual.airline_a[0] = l:base02
            let l:inactive.airline_a[1] = l:base00

            let l:normal.airline_b[0] = l:base02
            let l:normal.airline_b[1] = l:base01
            let l:insert.airline_b[0] = l:base02
            let l:insert.airline_b[1] = l:base00
            let l:replace.airline_b[0] = l:base02
            let l:replace.airline_b[1] = l:base00
            let l:visual.airline_b[0] = l:base02
            let l:visual.airline_b[1] = l:base01
            let l:inactive.airline_b[1] = l:base01

            let l:insert.airline_c[0] = l:base00
            let l:replace.airline_c[0] = l:base00
            let l:inactive.airline_c[0] = l:base01
            let l:inactive.airline_c[1] = l:base02
            let l:inactive_modified.airline_c[0] = l:base00

            let l:insert.airline_x[0] = l:base00
            let l:replace.airline_x[0] = l:base00
            let l:inactive.airline_x[0] = l:base01
            let l:inactive.airline_x[1] = l:base02

            let l:normal.airline_y[0] = l:base02
            let l:normal.airline_y[1] = l:base01
            let l:insert.airline_y[0] = l:base02
            let l:insert.airline_y[1] = l:base00
            let l:replace.airline_y[0] = l:base02
            let l:replace.airline_y[1] = l:base00
            let l:visual.airline_y[0] = l:base02
            let l:visual.airline_y[1] = l:base01
            let l:inactive.airline_y[0] = l:base01
            let l:inactive.airline_y[1] = l:base02

            let l:normal.airline_z[0] = l:base02
            let l:normal.airline_z[1] = l:base00
            let l:insert.airline_z[0] = l:base02
            let l:insert.airline_z[1] = l:base0
            let l:replace.airline_z[0] = l:base02
            let l:replace.airline_z[1] = l:base0
            let l:visual.airline_z[0] = l:base02
            let l:visual.airline_z[1] = l:base00
            let l:inactive.airline_z[0] = l:base01
            let l:inactive.airline_z[1] = l:base02

            let l:normal.airline_warning[0] = l:base02

            let l:normal.airline_error[0] = l:base02
            let l:normal_modified.airline_error[0] = l:base02
            let l:insert.airline_error[0] = l:base02
            let l:insert_modified.airline_error[0] = l:base02
            let l:replace.airline_error[0] = l:base02
            let l:replace_modified.airline_error[0] = l:base02
            let l:visual.airline_error[0] = l:base02
            let l:visual_modified.airline_error[0] = l:base02
        endif

    endif
endfunction
