" Krait (.krt) filetype detection.
augroup krait_ftdetect
  autocmd!
  autocmd BufRead,BufNewFile *.krt setfiletype krait
augroup END
