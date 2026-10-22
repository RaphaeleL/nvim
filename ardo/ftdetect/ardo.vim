" Ardo (.ardo) filetype detection.
augroup ardo_ftdetect
  autocmd!
  autocmd BufRead,BufNewFile *.ardo setfiletype ardo
augroup END
