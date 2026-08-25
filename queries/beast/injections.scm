; Beast embeds TypeScript source and expressions and hands final validation to
; Octane. Beast source slices are native TypeScript rather than TSX-shaped
; intermediate code.
; Continuation prefixes are omitted while all payload fragments are parsed as
; one logical TypeScript document.
(import_declaration
  "import" @injection.content
  source: (continued_line_expression
    (line_expression)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))

; Inline and block module/setup source.
((continued_source_code
  (source_code)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))

; A props parameter is preserved as TypeScript source.
(props_declaration
  parameter: (continued_line_expression
    (line_expression)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))

; Expressions inside text and attributes.
(interpolation
  body: (expression_body
    (expression_fragment)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))

(attribute
  value: (expression
    body: (expression_body
      (expression_fragment)+ @injection.content))
  (#set! injection.language "typescript")
  (#set! injection.combined))

(spread_attribute
  argument: (expression_body
    (expression_fragment)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))

; Raw style blocks are native CSS with their source indentation preserved.
((continued_style_source
  (style_source)+ @injection.content)
  (#set! injection.language "css")
  (#set! injection.combined))

; Conditions and loop expressions.
(if_clause
  condition: (continued_line_expression
    (line_expression)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))

(elseif_clause
  condition: (continued_line_expression
    (line_expression)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))

(each_statement
  iterable: (continued_each_iterable
    (line_expression)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))

(each_statement
  key: (continued_line_expression
    (line_expression)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))

; Switch discriminants and case expressions.
(switch_statement
  discriminant: (continued_line_expression
    (line_expression)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))

(case_clause
  condition: (continued_line_expression
    (line_expression)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))

; Catch bindings can be written directly or inside parentheses.
(catch_clause
  bindings: (continued_line_expression
    (line_expression)+ @injection.content)
  (#set! injection.language "typescript")
  (#set! injection.combined))
