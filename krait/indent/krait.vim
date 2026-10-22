" Krait indentation (basic).
" Blocks are `{ }` and statements end with `;`, so Vim's 'cindent' handles
" the common cases.  Delete or override this file to use your own settings.

if exists("b:did_indent")
  finish
endif

let b:did_indent = 1
let b:undo_indent = "setlocal cindent<"

setlocal cindent
