grammar jsbach;
options { language = Python3; }

root
    : functiondefinition* EOF
    ;

functiondefinition
    : FUNCTIONNAME (expressions*) '|:' instructions* ':|'
    ;

instructions
    : VARIABLENAME '<-' expressions                     # Assign
    | 'if' expressions '|:' instructions* ':|' ('else |:' instructions* ':|')?  # Ifelse
    | '<?>' expressions                                 # Read
    | '<!>' expressions*                                # Write
    | '<:>' VARIABLENAME                                # Play
    | VARIABLENAME '<<' expressions                     # Listinsert
    | '8<' expressions                                  # Listcut
    | 'while' expressions* '|:' (instructions)* ':|'    # While
    | FUNCTIONNAME (expressions*)?                      # Functioncall
    ;

expressions
    : expressions '==' expressions                      # Equals
    | expressions '!=' expressions                      # NotEquals
    | expressions '<'  expressions                      # Lower
    | expressions '<=' expressions                      # LowerOrEqual
    | expressions '>'  expressions                      # Greater
    | expressions '>=' expressions                      # GreaterOrEqual
    | expressions '*'  expressions                      # Multiply
    | expressions '/'  expressions                      # Divide
    | expressions '+'  expressions                      # Add
    | expressions '-'  expressions                      # Minus
    | expressions '%'  expressions                      # Remainder
    | '(' expressions ')'                               # OperationPriority
    | '{' MUSICALNOTE* '}'                              # Listinitialization
    | '#' VARIABLENAME                                  # Listsize
    | VARIABLENAME '[' expressions ']'                  # Listposition
    | VARIABLENAME                                      # VariableName
    | INTEGER                                           # Integer
    | MUSICALNOTE                                       # MusicalNote
    | NORMALSTRING                                      # String
    ;

MUSICALNOTE: [A-G]([0-9])?;
FUNCTIONNAME: [A-Z][a-zA-Z]*;
VARIABLENAME: [a-z][a-zA-Z]*;
INTEGER: [0-9]([0-9]*)?;
NORMALSTRING: '"' .*? '"';

COMMENTS: '~~~' .*? '~~~' -> skip;WS: [ \t\r\n]+ -> skip;