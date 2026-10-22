" Vim syntax file
" Language:    Krait
" Maintainer:  Krait compiler repository
" Filenames:   *.krt
" Last Change: 2026-10-18
"
" Krait is a strictly typed, ahead-of-time compiled systems language with
" Python-flavored keywords (`fn`, `for x in`, `and`/`or`/`not`,
" `match`/`case`/`then`) and C-style `{ }` braces.  Comments are `//` and
" nestable `/* */`; `#` introduces compile-time directives.

if exists("b:current_syntax")
  finish
endif

" Krait is case-sensitive; don't let 'ignorecase' leak into syntax matching.
syn case match

" Multi-line comments/strings: keep enough context when syncing.
syn sync minlines=200

" ---------------------------------------------------------------------------
" Numbers: decimal, 0x/0b/0o, floats/exponents, `_` separators
" ---------------------------------------------------------------------------
syn match kraitNumber    /\<\d[\d_]*\>/
syn match kraitHexNumber /\<0[xX][0-9a-fA-F_]\+\>/
syn match kraitBinNumber /\<0[bB][01_]\+\>/
syn match kraitOctNumber /\<0[oO][0-7_]\+\>/
syn match kraitFloat     /\<\d[\d_]*\.\d[\d_]*\%([eE][+-]\?\d\+\)\?\>/
syn match kraitFloat     /\<\d[\d_]*[eE][+-]\?\d\+\>/

" ---------------------------------------------------------------------------
" Operators (`to` / `until` are keywords; they are listed with the keywords)
" ---------------------------------------------------------------------------
syn match kraitOperator /\.\.\.\|:=\|==\|!=\|<=\|>=\|<<\|>>\|+=\|-=\|\*=\|\/=\|%=\|[-+*\/%&|^~<>=]/

" ---------------------------------------------------------------------------
" Comments:  // line comments ; nestable /* block */ comments ;
" /** documentation comments */
" ---------------------------------------------------------------------------
syn keyword kraitTodo TODO FIXME XXX NOTE HACK contained

syn region kraitCommentBlock matchgroup=kraitCommentBlock start="/\*\%(\*[\/\*]\@!\)\@!" end="\*\/" contains=kraitCommentBlockNest,kraitTodo,@Spell
syn region kraitCommentBlockNest matchgroup=kraitCommentBlock start="/\*" end="\*\/" contained transparent contains=kraitCommentBlockNest,kraitTodo,@Spell
syn region kraitDocComment matchgroup=kraitDocComment start="/\*\*[\/\*]\@!" end="\*\/" contains=kraitCommentBlockNest,kraitTodo,@Spell
syn match  kraitCommentLine "//.*$" contains=kraitTodo,@Spell

" ---------------------------------------------------------------------------
" Strings, character literals and f-strings.  f-strings interpolate `{expr}`
" parts; inside an interpolation, expressions highlight normally and strings
" may nest again.
" ---------------------------------------------------------------------------
syn match  kraitEscape        /\\u{[0-9A-Fa-f]\{1,6}}\|\\[ntr\\"'@]/ contained
syn match  kraitFStringEscape /\\[{}]/ contained

syn region kraitCharacter start=/'/ skip=/\\\\\|\\'/ end=/'/ oneline contains=kraitEscape
syn region kraitString    start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=kraitEscape,@Spell
" Multi-line """...""" (escapes) and raw r"..." / r"""...""" (no escapes); defined
" after kraitString so they win where both could start.
syn region kraitString    start=/"""/ skip=/\\\\\|\\"/ end=/"""/ contains=kraitEscape,@Spell
syn region kraitRawString start=/\<r"/ end=/"/ oneline contains=@Spell
syn region kraitRawString start=/\<r"""/ end=/"""/ contains=@Spell

syn region kraitFString start=/\<f"/ skip=/\\\\\|\\"/ end=/"/ contains=kraitEscape,kraitFStringEscape,kraitInterpolation,@Spell
syn region kraitInterpolation matchgroup=kraitInterpolationDelim start=/\\\@<!{/ end=/}/ contained contains=@kraitInterpContents

" ---------------------------------------------------------------------------
" Directives: #import, #load, #library, #assert, #all, #bake, #copy, #on, #extern, #char, #repeat, #type (`#` is never a comment)
" ---------------------------------------------------------------------------
syn match kraitDirective /#\a\w*/
syn match kraitBakeName  /#bake\s\+\zs\w\+/

" ---------------------------------------------------------------------------
" Keywords, types, names
" ---------------------------------------------------------------------------
syn keyword kraitKeyword and as break case continue default defer deinit else enum fails fn for if in match not or pub ref return struct then to until while using
syn keyword kraitBoolean true false
syn keyword kraitReserved async await class comptime impl module nil none some trait use yield ok error
syn keyword kraitBuiltin alloc free sizeof alignof offset
syn keyword kraitError error
syn keyword kraitBuiltinType bool char byte short ushort int uint long ulong i8 i16 i32 i64 u8 u16 u32 u64 f32 f64 float double string

syn match kraitType     /\<[A-Z]\w*\>/
syn match kraitConstant /\<[A-Z][A-Z_0-9]\+\>/
syn match kraitFunction /\<fn\s\+\zs\w\+/

" Expressions usable inside f-string `{...}` interpolation.
syn cluster kraitInterpContents contains=kraitNumber,kraitHexNumber,kraitBinNumber,kraitOctNumber,kraitFloat,kraitString,kraitFString,kraitCharacter,kraitEscape,kraitFStringEscape,kraitInterpolation,kraitOperator,kraitBoolean,kraitBuiltinType,kraitType,kraitConstant,kraitFunction,kraitBakeName,kraitKeyword,kraitReserved,kraitBuiltin,kraitError

" ---------------------------------------------------------------------------
" Highlighting
" ---------------------------------------------------------------------------
hi def link kraitTodo               Todo
hi def link kraitCommentBlock       Comment
hi def link kraitCommentBlockNest   Comment
hi def link kraitCommentLine        Comment
hi def link kraitDocComment         SpecialComment
hi def link kraitEscape             SpecialChar
hi def link kraitFStringEscape      SpecialChar
hi def link kraitCharacter          Character
hi def link kraitString             String
hi def link kraitRawString          String
hi def link kraitFString            String
hi def link kraitInterpolationDelim Delimiter
hi def link kraitNumber             Number
hi def link kraitHexNumber          Number
hi def link kraitBinNumber          Number
hi def link kraitOctNumber          Number
hi def link kraitFloat              Float
hi def link kraitOperator           Operator
hi def link kraitDirective          PreProc
hi def link kraitBakeName           Constant
hi def link kraitKeyword            Keyword
hi def link kraitBoolean            Boolean
hi def link kraitReserved           Keyword
hi def link kraitBuiltin            Function
hi def link kraitError              Exception
hi def link kraitBuiltinType        Type
hi def link kraitType               Type
hi def link kraitConstant           Constant
hi def link kraitFunction           Function

let b:current_syntax = "krait"
