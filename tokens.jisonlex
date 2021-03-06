// # The Tokens
// The tokens are the atomic units of our programs. We tag each one with a type.
// This stream of tokens will then be fed to the parser.
//
// Note that the rules are applied from top to bottom, first one to match.

%%

"//".*                // ignore comment

\n+                   return 'NEWLINE';
\s+                   // skip other whitespace

// Literals: the hard-coded values in your programs.
[0-9]+\b              return 'NUMBER';
\"[^"]*\"             return 'STRING';
\'[^']*\'             return 'STRING';
"true"                return 'TRUE';
"false"               return 'FALSE';
"null"                return 'NULL';
"undefined"           return 'UNDEFINED';

// Keywords
"this"                return 'THIS';
"function"            return 'FUNCTION';
"return"              return 'RETURN';
"var"                 return 'VAR'
"new"                 return 'NEW';

// Identifiers are names: variable and function names.
[a-zA-Z_]\w*          return 'IDENTIFIER';

// Operators
"==="                 return '===';
"!=="                 return '!==';
"&&"                  return '&&';
"||"                  return '||';

// We end with a catch all rule. Any one single character that has not been matched
// will be handled here. A few examples: `.`, `+`, `(` and `)`.
.                     return yytext;

<<EOF>>               return 'EOF';
