; Highlight queries for Ardo, using the capture names of nvim-treesitter
; (https://github.com/nvim-treesitter/nvim-treesitter/blob/main/CONTRIBUTING.md).
; In Neovim a later pattern wins over an earlier one, so general rules come
; first and specific ones after.

; ---------------------------------------------------------------- identifiers

(identifier) @variable

((identifier) @constant
  (#lua-match? @constant "^[A-Z][A-Z0-9_]+$"))

(parameter name: (identifier) @variable.parameter)

; `self` inside methods, `it` inside iterator loops
((identifier) @variable.builtin
  (#any-of? @variable.builtin "self" "it"))

; ---------------------------------------------------------------------- types

(type_identifier) @type
(primitive_type) @type.builtin
(scoped_type (identifier) @module)
(scoped_type (identifier) @type .)
(generic_type type: (scoped_type (identifier) @type .))

; `Point { .. }`, `geo.Point { .. }`, `Pair<int> { .. }`
(struct_literal type: (identifier) @type)
(struct_literal type: (field_expression field: (identifier) @type))
(struct_literal type: (generic_expression function: (identifier) @type))

; Capitalized names in value position are types/enums: `Shape.circle(..)`
((field_expression value: (identifier) @type)
  (#lua-match? @type "^[A-Z]")
  (#not-lua-match? @type "^[A-Z][A-Z0-9_]+$"))

(variant name: (identifier) @constant)
(variant_pattern name: (identifier) @constant .)
(variant_pattern name: (identifier) @type
  (#lua-match? @type "^[A-Z]"))

; ------------------------------------------------------------------ functions

(function_declaration name: (identifier) @function)
(function_declaration receiver: (_) name: (identifier) @function.method)

(call_expression function: (identifier) @function.call)
(call_expression function: (field_expression field: (identifier) @function.method.call))
(call_expression function: (generic_expression function: (identifier) @function.call))
(call_expression
  function: (generic_expression function: (field_expression field: (identifier) @function.method.call)))

((call_expression function: (identifier) @function.builtin)
  (#any-of? @function.builtin
    "assert" "str" "alloc" "free" "sizeof" "alignof" "offset" "move_out"))

; Capitalized callee: `Point(1, 2)` constructs a struct
((call_expression function: (identifier) @constructor)
  (#lua-match? @constructor "^[A-Z]"))

(named_argument name: (identifier) @variable.parameter)

; ------------------------------------------------------------ fields, modules

(field_declaration name: (identifier) @variable.member)
(field_initializer name: (identifier) @variable.member)
(field_expression field: (identifier) @variable.member)
(target_expression field: (identifier) @variable.member)

(import_directive alias: (identifier) @module)

; --------------------------------------------------------------------- labels

(label) @label

; ------------------------------------------------------------------- keywords

[
  "struct"
  "enum"
  "union"
  "const"
  "var"
] @keyword.type

"function" @keyword.function

[
  "return"
] @keyword.return

[
  "if"
  "else"
  "then"
  "match"
  "case"
  "default"
] @keyword.conditional

(fallback "else(" @keyword.exception)
(fallback "else" @keyword.exception)

[
  "for"
  "while"
  "break"
  "continue"
] @keyword.repeat

[
  "and"
  "or"
  "not"
  "in"
  "as"
  "xx"
  "to"
  "until"
] @keyword.operator

[
  "fails"
  "try"
  "error"
] @keyword.exception

[
  "defer"
  "using"
  "ref"
] @keyword

(visibility) @keyword.modifier
(function_declaration name: (identifier) @keyword.function
  (#eq? @keyword.function "deinit"))

[
  "#import"
  "#load"
  "#library"
  "#c_import"
] @keyword.import

[
  "#assert"
  "#bake"
  "#on"
  "#all"
  "#char"
  "#repeat"
  "#type"
  "#ignore"
  "#entrypoint"
  "#pointer"
  "#deref"
  "#empty"
  "#ref"
  "#go"
  "#call"
  "#error"
  "#cast"
  "#if"
  "#target"
  "#bits"
] @keyword.directive

(attribute) @attribute

(variant_pattern name: (identifier) @keyword.exception
  (#any-of? @keyword.exception "ok" "error"))

; ------------------------------------------------------------------- literals

(integer_literal) @number
(float_literal) @number.float
(boolean_literal) @boolean
(null_literal) @constant.builtin
(char_literal) @character
(wildcard_pattern) @character.special

[
  (string_literal)
  (multiline_string_literal)
  (raw_string_literal)
  (format_string)
] @string

(escape_sequence) @string.escape
(format_spec) @string.special

(interpolation
  "{" @punctuation.special
  "}" @punctuation.special)

; ------------------------------------------------------------------ operators

[
  "=" ":=" "+=" "-=" "*=" "/=" "%=" "+%=" "-%=" "*%="
  "+" "-" "*" "/" "%" "+%" "-%" "*%"
  "==" "!=" "<" "<=" ">" ">="
  "&" "|" "^" "~" "<<" ">>"
  ".."
] @operator

(variadic_parameter) @operator

; ---------------------------------------------------------------- punctuation

[ "(" ")" "[" "]" "{" "}" ] @punctuation.bracket
(type_arguments [ "<" ">" ] @punctuation.bracket)
(type_parameters [ "<" ">" ] @punctuation.bracket)
(cast_directive [ "<" ">" ] @punctuation.bracket)
[ "," "." ":" ";" ] @punctuation.delimiter

; ------------------------------------------------------------------- comments

[
  (line_comment)
  (block_comment)
] @comment @spell

((block_comment) @comment.documentation
  (#lua-match? @comment.documentation "^/%*%*[^/]"))
