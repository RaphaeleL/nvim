; Scopes
[
  (source_file)
  (block)
  (function_declaration)
  (for_statement)
  (match_arm)
] @local.scope

; Definitions
(function_declaration name: (identifier) @local.definition.function)
(parameter name: (identifier) @local.definition.parameter)
(var_declaration name: (identifier) @local.definition.var)
(for_statement variable: (identifier) @local.definition.var)
(bake_declaration name: (identifier) @local.definition.constant)
(struct_declaration name: (type_identifier) @local.definition.type)
(enum_declaration name: (type_identifier) @local.definition.type)
(field_declaration name: (identifier) @local.definition.field)
(type_parameters (type_identifier) @local.definition.type)
(import_directive alias: (identifier) @local.definition.import)

; References
(identifier) @local.reference
(type_identifier) @local.reference
