# Krait for Vim

Syntax highlighting, filetype detection, comment settings and basic
indentation for Krait (`.krt`) files.  Works with Vim 8+ and Neovim;
Neovim users who want a Lua-native filetype registration can use
[`../neovim/`](../neovim/) instead.

## Install

Classic layout (copy or symlink into your Vim directory):

    cp -r syntax ftdetect ftplugin indent ~/.vim/

or with a plugin manager (vim-plug):

    Plug '~/workspace/krait/editors/vim'

## Contents

| File | Effect |
|------|--------|
| `syntax/krait.vim`   | highlighting (defines `b:current_syntax = "krait"`) |
| `ftdetect/krait.vim` | `*.krt` → `filetype=krait` |
| `ftplugin/krait.vim` | `commentstring`, `comments`, `.krt` in `suffixesadd`, 4-space style |
| `indent/krait.vim`   | enables basic `'cindent'` (remove the file to opt out) |

## Language server

Vim has no built-in LSP client; any client plugin can run `krait --lsp` (see
[`docs/lsp.md`](../../docs/lsp.md)). With
[vim-lsp](https://github.com/prabirshrestha/vim-lsp):

    au User lsp_setup call lsp#register_server({
        \ 'name': 'krait',
        \ 'cmd': {server_info -> ['krait', '--lsp']},
        \ 'allowlist': ['krait'],
        \ })

With [coc.nvim](https://github.com/neoclide/coc.nvim), in `:CocConfig`:

    "languageserver": {
      "krait": { "command": "krait", "args": ["--lsp"], "filetypes": ["krait"] }
    }

The ftplugin sets `shiftwidth=4 softtabstop=4 expandtab` (matching the style
of the compiler's `examples/`); disable it with
`let g:krait_recommended_style = 0` in your vimrc.

## Highlighted groups

`kraitCommentBlock`, `kraitCommentBlockNest`, `kraitCommentLine`,
`kraitDocComment`, `kraitTodo`, `kraitString`, `kraitRawString`, `kraitFString`, `kraitEscape`,
`kraitFStringEscape`, `kraitInterpolationDelim`, `kraitCharacter`,
`kraitNumber`, `kraitFloat`, `kraitHexNumber`, `kraitBinNumber`,
`kraitOctNumber`, `kraitOperator`, `kraitDirective`, `kraitBakeName`,
`kraitKeyword`, `kraitBoolean`, `kraitReserved`, `kraitBuiltin`, `kraitError`,
`kraitBuiltinType`, `kraitType`, `kraitConstant`, `kraitFunction`.

All of them link to standard groups, so any colorscheme colors them; you can
override any group, e.g.:

    hi kraitType       ctermfg=...
    hi kraitDirective  ctermfg=...
    hi kraitDocComment ctermfg=...
