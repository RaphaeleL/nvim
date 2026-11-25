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

; `long(x)`: a checked conversion written like a call
(call_expression
  function: (identifier) @type.builtin
  (#any-of? @type.builtin "byte" "short" "ushort" "int" "uint" "long" "ulong" "s8" "s16" "s32"
    "s64" "u8" "u16" "u32" "u64" "f32" "f64" "float" "double" "char"))
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

; `geo.Point.new(3)`: a capitalized middle segment names a type too (ADR-180)
((field_expression value: (field_expression field: (identifier) @type))
  (#lua-match? @type "^[A-Z]")
  (#not-lua-match? @type "^[A-Z][A-Z0-9_]+$"))

(const_declaration receiver: (type_identifier) @type) ; `const #on Point ORIGIN` (ADR-181)

; `Box<int>.of(1)`: the generic head of an associated call is a type (ADR-183)
((field_expression value: (generic_expression function: (identifier) @type))
  (#lua-match? @type "^[A-Z]"))

(variant name: (identifier) @constant)
(variant_pattern name: (identifier) @constant .)
(variant_pattern name: (identifier) @type
  (#lua-match? @type "^[A-Z]"))

; ------------------------------------------------------------------ functions

(function_declaration name: (identifier) @function)
(function_declaration receiver: (_) name: (identifier) @function.method)
(function_declaration name: (operator_name) @operator) ; ADR-162

(call_expression function: (identifier) @function.call)
(call_expression function: (field_expression field: (identifier) @function.method.call))
(call_expression function: (generic_expression function: (identifier) @function.call))
(call_expression
  function: (generic_expression function: (field_expression field: (identifier) @function.method.call)))

((call_expression function: (identifier) @function.builtin)
  (#any-of? @function.builtin
    "assert" "str" "alloc" "free" "sizeof" "alignof" "offset" "move_out"
    "volatile_load" "volatile_store" "fence"
    "atomic_load" "atomic_store" "atomic_swap" "atomic_add" "atomic_sub"
    "atomic_and" "atomic_or" "atomic_xor" "atomic_cas"))

; Capitalized callee: `Point(1, 2)` constructs a struct
((call_expression function: (identifier) @constructor)
  (#lua-match? @constructor "^[A-Z]"))

(named_argument name: (identifier) @variable.parameter)

; ------------------------------------------------------------ fields, modules

(field_declaration name: (identifier) @variable.member)
(payload_field name: (identifier) @variable.member)
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
  "type"
  "distinct"
  "var"
] @keyword.type

"function" @keyword.function

[
  "return"
  "yield"
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
  "try"
  "with"
  "error"
] @keyword.exception

[
  "defer"
  "using"
] @keyword

(visibility) @keyword.modifier

; Reserved words: identifiers to the grammar, rejected by the compiler
((identifier) @keyword
  (#any-of? @keyword
    "async" "await" "class" "impl" "module" "nil" "trait" "use" "yield"))

; `none`: the missing value of a `!T` (ADR-199)
((identifier) @constant.builtin
  (#eq? @constant.builtin "none"))
(optional_type "#maybe" @keyword)
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
  "#on"
  "#all"
  "#char"
  "#embed"
  "#quote"
  "#insert"
  "#repeat"
  "#type"
  "#ignore"
  "#empty"
  "#borrow"
  "#go"
  "#run"
  "#todo"
  "#here"
  "#unreachable"
  "#unsafe"
  "#likely"
  "#unlikely"
  "is"
  "#require"
  "#call"
  "#error"
  "#cast"
  "#if"
  "#target"
  "#bits"
  "#key"
  "#fields"
] @keyword.directive

; Attributes in front of a declaration: `#packed struct`, `#decorate(f) function`
(attribute) @attribute
(attribute
  [
    "#copy" "#autoinit" "#no_eq" "#value" "#flags" "#packed" "#c_callback" "#export" "#decorate"
    "#deprecated" "#no_trace" "#inline" "#noinline" "#cold" "#pre" "#post" "#thread_local" "#align" "#extern"
  ] @keyword.directive)

(variant_pattern name: (identifier) @keyword.exception
  (#any-of? @keyword.exception "ok" "error"))

; ------------------------------------------------------------------- literals

(integer_literal) @number
(float_literal) @number.float
(boolean_literal) @boolean
(null_literal) @constant.builtin
(default_value) @constant.builtin
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
  "=" ":=" "+=" "-=" "*=" "/=" "%=" "+%=" "-%=" "*%=" "++" "--"
  "+" "-" "*" "/" "%" "+%" "-%" "*%"
  "==" "!=" "<" "<=" ">" ">="
  "&" "|" "^" "~" "<<" ">>"
  ".."
] @operator

(variadic_parameter) @operator
(variadic_marker) @operator
(spread_argument "..") @operator

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



; `case Shape.rect(h = hh)`: a named payload field (ADR-184)
(field_pattern name: (identifier) @property)
(struct_pattern type: (identifier) @type)

(bind_pattern name: (identifier) @variable)
"@" @operator
(rest_pattern name: (identifier) @variable)

