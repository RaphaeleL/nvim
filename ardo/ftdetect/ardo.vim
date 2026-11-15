" Ardo (.ao) filetype detection.
augroup ardo_ftdetect
  autocmd!
  autocmd BufRead,BufNewFile *.ao setfiletype ardo
augroup END
