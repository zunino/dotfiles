" Check :help autoload for naming scheme
function replace#prompt()
    if @/ == ""
        echo "No search match to be replaced."
        return
    endif
    let view = winsaveview()
    call inputsave()
    let replacement = input("Replace with: ")
    call inputrestore()
    if replacement != ""
        execute ":%s//".replacement."/gc"
    endif
    call winrestview(view)
    call setreg('/', [])
endfunction

