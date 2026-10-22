" Krait ftplugin: comments and the recommended code style.

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setlocal commentstring< comments< suffixesadd< shiftwidth< softtabstop< expandtab<"

setlocal commentstring=//\ %s
" `/* */` (nm: nestable) and `//` comments, as used in the language.
setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal suffixesadd=.krt

" The compiler's examples/ use 4 spaces and no hard tabs.
" Set g:krait_recommended_style = 0 to keep your own whitespace settings.
if !exists("g:krait_recommended_style") || g:krait_recommended_style == 1
  setlocal shiftwidth=4 softtabstop=4 expandtab
endif
