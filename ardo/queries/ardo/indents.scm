[
  (block)
  (field_list)
  (variant_list)
  (struct_body)
  (match_expression)
  (list_literal)
  (dict_literal)
  (arguments)
  (parameters)
  (union_declaration)
] @indent.begin

[ "}" "]" ")" ] @indent.branch @indent.end

[
  (line_comment)
  (block_comment)
  (multiline_string_literal)
  (raw_string_literal)
] @indent.auto
