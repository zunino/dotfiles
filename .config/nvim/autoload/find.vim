" Check :help autoload for naming scheme
function find#in_files(has_bang, args)
    let search_term = '""'
    let glob_arg = ""
    let has_col_info = 0
    let fullscreen = a:has_bang
    
    if len(a:args) > 0
        let search_term = a:args[0]
    endif
    if len(a:args) > 1
        let glob_arg = "-g " . shellescape(a:args[1]) . " "
    endif

    let rg_cmd = "rg --line-number --no-heading --color=always --smart-case "
        \ . glob_arg . search_term

    let options = call("fzf#vim#with_preview", [{"options": "--delimiter : --nth 3.."}])

    call fzf#vim#grep(rg_cmd, has_col_info, options, fullscreen)
endfunction

