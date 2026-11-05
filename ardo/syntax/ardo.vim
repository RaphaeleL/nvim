" Vim syntax file
" Language:    Ardo
" Maintainer:  Ardo compiler repository
" Filenames:   *.ardo
" Last Change: 2026-10-18
"
" Ardo is a strictly typed, ahead-of-time compiled systems language with
" Python-flavored keywords (`function`, `for x in`, `and`/`or`/`not`,
" `match`/`case`/`then`) and C-style `{ }` braces.  Comments are `//` and
" nestable `/* */`; `#` introduces compile-time directives.

if exists("b:current_syntax")
  finish
endif

" Ardo is case-sensitive; don't let 'ignorecase' leak into syntax matching.
syn case match

" Multi-line comments/strings: keep enough context when syncing.
syn sync minlines=200

" ---------------------------------------------------------------------------
" Numbers: decimal, 0x/0b/0o, floats/exponents, `_` separators
" ---------------------------------------------------------------------------
syn match ardoNumber    /\<\d[0-9_]*\>/
syn match ardoHexNumber /\<0[xX][0-9a-fA-F_]\+\>/
syn match ardoBinNumber /\<0[bB][01_]\+\>/
syn match ardoOctNumber /\<0[oO][0-7_]\+\>/
syn match ardoFloat     /\<\d[0-9_]*\.\d[0-9_]*\%([eE][+-]\?\d\+\)\?\>/
syn match ardoFloat     /\<\d[0-9_]*[eE][+-]\?\d\+\>/

" ---------------------------------------------------------------------------
" Operators (`to` / `until` are keywords; they are listed with the keywords)
" ---------------------------------------------------------------------------
syn match ardoOperator /\.\.\.\|:=\|==\|!=\|<=\|>=\|<<\|>>\|+=\|-=\|\*=\|\/=\|%=\|[-+*\/%&|^~<>=]/

" ---------------------------------------------------------------------------
" Comments:  // line comments ; nestable /* block */ comments ;
" /** documentation comments */
" ---------------------------------------------------------------------------
syn keyword ardoTodo TODO FIXME XXX NOTE HACK contained

syn region ardoCommentBlock matchgroup=ardoCommentBlock start="/\*\%(\*[\/\*]\@!\)\@!" end="\*\/" contains=ardoCommentBlockNest,ardoTodo,@Spell
syn region ardoCommentBlockNest matchgroup=ardoCommentBlock start="/\*" end="\*\/" contained transparent contains=ardoCommentBlockNest,ardoTodo,@Spell
syn region ardoDocComment matchgroup=ardoDocComment start="/\*\*[\/\*]\@!" end="\*\/" contains=ardoCommentBlockNest,ardoTodo,@Spell
syn match  ardoCommentLine "//.*$" contains=ardoTodo,@Spell

" ---------------------------------------------------------------------------
" Strings, character literals and f-strings.  f-strings interpolate `{expr}`
" parts; inside an interpolation, expressions highlight normally and strings
" may nest again.
" ---------------------------------------------------------------------------
syn match  ardoEscape        /\\u{[0-9A-Fa-f]\{1,6}}\|\\[ntr\\"'@]/ contained
syn match  ardoFStringEscape /\\[{}]/ contained

syn region ardoCharacter start=/'/ skip=/\\\\\|\\'/ end=/'/ oneline contains=ardoEscape
" A loop label `'outer` (no closing quote); defined after ardoCharacter so it wins.
syn match  ardoLabel         /'\h\w*\>'\@!/
syn region ardoString    start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=ardoEscape,@Spell
" Multi-line """...""" (escapes) and raw r"..." / r"""...""" (no escapes); defined
" after ardoString so they win where both could start.
syn region ardoString    start=/"""/ skip=/\\\\\|\\"/ end=/"""/ contains=ardoEscape,@Spell
syn region ardoRawString start=/\<r"/ end=/"/ oneline contains=@Spell
syn region ardoRawString start=/\<r"""/ end=/"""/ contains=@Spell

syn region ardoFString start=/\<f"/ skip=/\\\\\|\\"/ end=/"/ contains=ardoEscape,ardoFStringEscape,ardoInterpolation,@Spell
syn region ardoInterpolation matchgroup=ardoInterpolationDelim start=/\\\@<!{/ end=/}/ contained contains=@ardoInterpContents

" ---------------------------------------------------------------------------
" Directives: #import, #load, #library, #assert, #all, #copy, #on, #extern, #char, #repeat, #type, #cast, #entrypoint (`#` is never a comment)
" ---------------------------------------------------------------------------
syn match ardoDirective /#\a\w*/
syn match ardoBakeName  /\<const\s\+\zs\w\+/

" ---------------------------------------------------------------------------
" Keywords, types, names
" ---------------------------------------------------------------------------
syn keyword ardoKeyword and as break case const continue default defer deinit else enum fails function for if in match not or pub ref return struct then to try until while using xx
syn keyword ardoBoolean true false
syn keyword ardoReserved async await class comptime impl module nil none some trait use yield ok error
syn keyword ardoBuiltin alloc free sizeof alignof offset move_out assert
syn keyword ardoError error
syn keyword ardoBuiltinType bool char byte short ushort int uint long ulong i8 i16 i32 i64 u8 u16 u32 u64 f32 f64 float double string

syn match ardoType     /\<[A-Z]\w*\>/
syn match ardoConstant /\<[A-Z][A-Z_0-9]\+\>/
syn match ardoFunction /\<function\s\+\zs\w\+/
" `str(x)` is a builtin only when called: `str.concat` is the str module.
syn match ardoBuiltin  /\<str\ze\s*(/

" Expressions usable inside f-string `{...}` interpolation.
syn cluster ardoInterpContents contains=ardoNumber,ardoHexNumber,ardoBinNumber,ardoOctNumber,ardoFloat,ardoString,ardoFString,ardoCharacter,ardoEscape,ardoFStringEscape,ardoInterpolation,ardoOperator,ardoBoolean,ardoBuiltinType,ardoType,ardoConstant,ardoFunction,ardoBakeName,ardoKeyword,ardoReserved,ardoBuiltin,ardoError

" ---------------------------------------------------------------------------
" Highlighting
" ---------------------------------------------------------------------------
hi def link ardoTodo               Todo
hi def link ardoCommentBlock       Comment
hi def link ardoCommentBlockNest   Comment
hi def link ardoCommentLine        Comment
hi def link ardoDocComment         SpecialComment
hi def link ardoEscape             SpecialChar
hi def link ardoFStringEscape      SpecialChar
hi def link ardoCharacter          Character
hi def link ardoLabel              Label
hi def link ardoString             String
hi def link ardoRawString          String
hi def link ardoFString            String
hi def link ardoInterpolationDelim Delimiter
hi def link ardoNumber             Number
hi def link ardoHexNumber          Number
hi def link ardoBinNumber          Number
hi def link ardoOctNumber          Number
hi def link ardoFloat              Float
hi def link ardoOperator           Operator
hi def link ardoDirective          PreProc
hi def link ardoBakeName           Constant
hi def link ardoKeyword            Keyword
hi def link ardoBoolean            Boolean
hi def link ardoReserved           Keyword
hi def link ardoBuiltin            Function
hi def link ardoError              Exception
hi def link ardoBuiltinType        Type
hi def link ardoType               Type
hi def link ardoConstant           Constant
hi def link ardoFunction           Function

let b:current_syntax = "ardo"
