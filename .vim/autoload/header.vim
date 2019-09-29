function! header#add()
    let def_time_locale = v:lc_time
    language time en_US.UTF-8
    call append(0, [
      \ "/**",
      \ " * " . toupper(expand("%:t")),
      \ " * ",
      \ " * ",
      \ " * ",
      \ " * Andre Zunino <neyzunino@gmail.com>",
      \ " * " . strftime("%d %B %Y"),
      \ " */",
      \ ""
    \])
    execute "language time" def_time_locale
endfunction

