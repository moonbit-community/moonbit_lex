pub(all) typealias Position = Unit

pub(all) enum Token {
  EOF
  PARSE_LBRACE
  LET
  AS
  UNDERSCORE
  RBRACE
  LPAREN
  RPAREN
  LBRACKET
  RBRACKET
  EQ
  SEMICOLON
  FAT_ARROW
  BAR
  STAR
  PLUS
  QUESTION
  MINUS
  CARET
  RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE((String, String, String))
  LBRACE_CODE_RBRACE(String)
  LC_IDENT(String)
  CHAR(Char)
  STRING(String)
}

pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    EOF => TK_EOF
    PARSE_LBRACE => TK_PARSE_LBRACE
    LET => TK_LET
    AS => TK_AS
    UNDERSCORE => TK_UNDERSCORE
    RBRACE => TK_RBRACE
    LPAREN => TK_LPAREN
    RPAREN => TK_RPAREN
    LBRACKET => TK_LBRACKET
    RBRACKET => TK_RBRACKET
    EQ => TK_EQ
    SEMICOLON => TK_SEMICOLON
    FAT_ARROW => TK_FAT_ARROW
    BAR => TK_BAR
    STAR => TK_STAR
    PLUS => TK_PLUS
    QUESTION => TK_QUESTION
    MINUS => TK_MINUS
    CARET => TK_CARET
    RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE(_) => TK_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE
    LBRACE_CODE_RBRACE(_) => TK_LBRACE_CODE_RBRACE
    LC_IDENT(_) => TK_LC_IDENT
    CHAR(_) => TK_CHAR
    STRING(_) => TK_STRING
  }
}

pub(all) enum TokenKind {
  TK_EOF
  TK_PARSE_LBRACE
  TK_LET
  TK_AS
  TK_UNDERSCORE
  TK_RBRACE
  TK_LPAREN
  TK_RPAREN
  TK_LBRACKET
  TK_RBRACKET
  TK_EQ
  TK_SEMICOLON
  TK_FAT_ARROW
  TK_BAR
  TK_STAR
  TK_PLUS
  TK_QUESTION
  TK_MINUS
  TK_CARET
  TK_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE
  TK_LBRACE_CODE_RBRACE
  TK_LC_IDENT
  TK_CHAR
  TK_STRING
}

pub impl Show for TokenKind with output(self, logger) {
  logger.write_string(
    match self {
      TK_EOF => "\"eof\""
      TK_PARSE_LBRACE => "\"parse {\""
      TK_LET => "\"let\""
      TK_AS => "\"as\""
      TK_UNDERSCORE => "\"_\""
      TK_RBRACE => "\"}\""
      TK_LPAREN => "\"(\""
      TK_RPAREN => "\")\""
      TK_LBRACKET => "\"[\""
      TK_RBRACKET => "\"]\""
      TK_EQ => "\"=\""
      TK_SEMICOLON => "\";\""
      TK_FAT_ARROW => "\"=>\""
      TK_BAR => "\"|\""
      TK_STAR => "\"*\""
      TK_PLUS => "\"+\""
      TK_QUESTION => "\"?\""
      TK_MINUS => "\"-\""
      TK_CARET => "\"^\""
      TK_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE => "RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE"
      TK_LBRACE_CODE_RBRACE => "LBRACE_CODE_RBRACE"
      TK_LC_IDENT => "LC_IDENT"
      TK_CHAR => "CHAR"
      TK_STRING => "STRING"
    }
  )
}

pub type! ParseError {
  UnexpectedToken(Token, (Position, Position), Array[TokenKind])
  UnexpectedEndOfInput(Position, Array[TokenKind])
}

typealias YYObj = Error

priv type! YYObj_Void

priv type! YYObj_Char Char

priv type! YYObj_Unit Unit

priv type! YYObj_String String

priv type! YYObj__String__String__String_ (String, String, String)

typealias YYState = (YYSymbol) -> YYDecision

typealias YYAction = (Position, ArrayView[(YYObj, Position, Position)]) -> YYObj

priv enum YYDecision {
  Accept
  Shift(YYState)
  Reduce(Int, YYSymbol, YYAction)
  ReduceNoLookahead(Int, YYSymbol, YYAction)
  Error
}

priv enum YYSymbol {
  T_EOF
  T_PARSE_LBRACE
  T_LET
  T_AS
  T_UNDERSCORE
  T_RBRACE
  T_LPAREN
  T_RPAREN
  T_LBRACKET
  T_RBRACKET
  T_EQ
  T_SEMICOLON
  T_FAT_ARROW
  T_BAR
  T_STAR
  T_PLUS
  T_QUESTION
  T_MINUS
  T_CARET
  T_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE
  T_LBRACE_CODE_RBRACE
  T_LC_IDENT
  T_CHAR
  T_STRING
  NT_lex
  NT_header
  NT_trailer
  NT_named_regex_list
  NT_named_regexe
  NT_rule_list
  NT_rule
  NT_rule_item_list
  NT_rule_item
  NT_regex
  NT_alias
  NT_alternation
  NT_concatenation
  NT_repetition
  NT_atom
  NT_character_class
  NT_character_class_inner
  NT_character_class_item
  EOI
}

// Workaround for EOI unused warning
fn init {
  match EOI {
    EOI => ()
    _ => ()
  }
}

fn yy_action_0(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_1(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_2(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_3(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_4(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_5(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_6(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_7(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_8(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_9(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_10(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_11(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_12(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_13(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_14(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_15(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_16(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_17(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_18(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_19(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_20(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_21(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_22(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_23(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_24(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_25(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_26(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_27(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_28(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_29(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_30(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_31(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_32(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_33(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_34(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_35(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_36(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_action_37(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Unit({(); })
}

fn yy_input(token : Token, _start_pos : Position, _end_pos : Position) -> (YYSymbol, YYObj) {
  match token {
    EOF => (T_EOF, YYObj_Void)
    PARSE_LBRACE => (T_PARSE_LBRACE, YYObj_Void)
    LET => (T_LET, YYObj_Void)
    AS => (T_AS, YYObj_Void)
    UNDERSCORE => (T_UNDERSCORE, YYObj_Void)
    RBRACE => (T_RBRACE, YYObj_Void)
    LPAREN => (T_LPAREN, YYObj_Void)
    RPAREN => (T_RPAREN, YYObj_Void)
    LBRACKET => (T_LBRACKET, YYObj_Void)
    RBRACKET => (T_RBRACKET, YYObj_Void)
    EQ => (T_EQ, YYObj_Void)
    SEMICOLON => (T_SEMICOLON, YYObj_Void)
    FAT_ARROW => (T_FAT_ARROW, YYObj_Void)
    BAR => (T_BAR, YYObj_Void)
    STAR => (T_STAR, YYObj_Void)
    PLUS => (T_PLUS, YYObj_Void)
    QUESTION => (T_QUESTION, YYObj_Void)
    MINUS => (T_MINUS, YYObj_Void)
    CARET => (T_CARET, YYObj_Void)
    RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE(data) => (T_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE, YYObj__String__String__String_(data))
    LBRACE_CODE_RBRACE(data) => (T_LBRACE_CODE_RBRACE, YYObj_String(data))
    LC_IDENT(data) => (T_LC_IDENT, YYObj_String(data))
    CHAR(data) => (T_CHAR, YYObj_Char(data))
    STRING(data) => (T_STRING, YYObj_String(data))
  }
}

// [0, lex → • header named_regex_list rule_list trailer, $]
// [1, header → • LBRACE_CODE_RBRACE, $ / LET / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
// [2, header → •, $ / LET / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
// [38, lex_prime → • lex, $]
fn yy_state_0(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_lex => Shift(yy_state_1)
    T_LBRACE_CODE_RBRACE => Shift(yy_state_2)
    NT_header => Shift(yy_state_3)
    T_LET | T_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE | EOI => Reduce(0, NT_header, yy_action_36)
    _ => Error
  }
}

// [38, lex_prime → lex •, $]
fn yy_state_1(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

// [1, header → LBRACE_CODE_RBRACE •, $ / LET / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_2(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_header, yy_action_8)
}

// [0, lex → header • named_regex_list rule_list trailer, $]
// [5, named_regex_list → • named_regexe named_regex_list, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
// [6, named_regex_list → •, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
// [7, named_regexe → • LET LC_IDENT EQ regex SEMICOLON, $ / LET / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_3(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LET => Shift(yy_state_4)
    NT_named_regexe => Shift(yy_state_42)
    NT_named_regex_list => Shift(yy_state_44)
    T_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE | T_LBRACE_CODE_RBRACE | EOI => Reduce(0, NT_named_regex_list, yy_action_37)
    _ => Error
  }
}

// [7, named_regexe → LET • LC_IDENT EQ regex SEMICOLON, $ / LET / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_4(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LC_IDENT => Shift(yy_state_5)
    _ => Error
  }
}

// [7, named_regexe → LET LC_IDENT • EQ regex SEMICOLON, $ / LET / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_5(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_EQ => Shift(yy_state_6)
    _ => Error
  }
}

// [7, named_regexe → LET LC_IDENT EQ • regex SEMICOLON, $ / LET / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
// [14, regex → • alias, SEMICOLON]
// [15, alias → • alternation, SEMICOLON]
// [16, alias → • alternation AS LC_IDENT, SEMICOLON]
// [17, alternation → • concatenation, AS / SEMICOLON]
// [18, alternation → • concatenation BAR alternation, AS / SEMICOLON]
// [19, concatenation → • repetition, AS / SEMICOLON / BAR]
// [20, concatenation → • repetition concatenation, AS / SEMICOLON / BAR]
// [21, repetition → • atom, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / LC_IDENT / CHAR / STRING]
// [22, repetition → • atom STAR, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / LC_IDENT / CHAR / STRING]
// [23, repetition → • atom PLUS, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / LC_IDENT / CHAR / STRING]
// [24, repetition → • atom QUESTION, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / LC_IDENT / CHAR / STRING]
// [25, atom → • LPAREN alternation RPAREN, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [26, atom → • character_class, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [27, atom → • LC_IDENT, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [28, atom → • CHAR, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [29, atom → • STRING, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [30, atom → • UNDERSCORE, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [31, atom → • EOF, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [32, character_class → • LBRACKET character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [33, character_class → • LBRACKET CARET character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / SEMICOLON / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_6(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_7)
    T_EOF => Shift(yy_state_18)
    T_UNDERSCORE => Shift(yy_state_19)
    T_STRING => Shift(yy_state_20)
    T_CHAR => Shift(yy_state_21)
    T_LC_IDENT => Shift(yy_state_22)
    NT_character_class => Shift(yy_state_23)
    T_LPAREN => Shift(yy_state_24)
    NT_atom => Shift(yy_state_27)
    NT_repetition => Shift(yy_state_31)
    NT_concatenation => Shift(yy_state_33)
    NT_alternation => Shift(yy_state_36)
    NT_alias => Shift(yy_state_39)
    NT_regex => Shift(yy_state_40)
    _ => Error
  }
}

// [32, character_class → LBRACKET • character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [33, character_class → LBRACKET • CARET character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [34, character_class_inner → • character_class_item character_class_inner, RBRACKET]
// [35, character_class_inner → • character_class_item, RBRACKET]
// [36, character_class_item → • CHAR, RBRACKET / CHAR]
// [37, character_class_item → • CHAR MINUS CHAR, RBRACKET / CHAR]
fn yy_state_7(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_CHAR => Shift(yy_state_8)
    NT_character_class_item => Shift(yy_state_11)
    T_CARET => Shift(yy_state_13)
    NT_character_class_inner => Shift(yy_state_16)
    _ => Error
  }
}

// [36, character_class_item → CHAR •, RBRACKET / CHAR]
// [37, character_class_item → CHAR • MINUS CHAR, RBRACKET / CHAR]
fn yy_state_8(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_MINUS => Shift(yy_state_9)
    T_RBRACKET | T_CHAR => Reduce(1, NT_character_class_item, yy_action_26)
    _ => Error
  }
}

// [37, character_class_item → CHAR MINUS • CHAR, RBRACKET / CHAR]
fn yy_state_9(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_CHAR => Shift(yy_state_10)
    _ => Error
  }
}

// [37, character_class_item → CHAR MINUS CHAR •, RBRACKET / CHAR]
fn yy_state_10(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_character_class_item, yy_action_6)
}

// [34, character_class_inner → • character_class_item character_class_inner, RBRACKET]
// [34, character_class_inner → character_class_item • character_class_inner, RBRACKET]
// [35, character_class_inner → • character_class_item, RBRACKET]
// [35, character_class_inner → character_class_item •, RBRACKET]
// [36, character_class_item → • CHAR, RBRACKET / CHAR]
// [37, character_class_item → • CHAR MINUS CHAR, RBRACKET / CHAR]
fn yy_state_11(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_CHAR => Shift(yy_state_8)
    NT_character_class_item => Shift(yy_state_11)
    NT_character_class_inner => Shift(yy_state_12)
    T_RBRACKET => Reduce(1, NT_character_class_inner, yy_action_18)
    _ => Error
  }
}

// [34, character_class_inner → character_class_item character_class_inner •, RBRACKET]
fn yy_state_12(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_character_class_inner, yy_action_12)
}

// [33, character_class → LBRACKET CARET • character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [34, character_class_inner → • character_class_item character_class_inner, RBRACKET]
// [35, character_class_inner → • character_class_item, RBRACKET]
// [36, character_class_item → • CHAR, RBRACKET / CHAR]
// [37, character_class_item → • CHAR MINUS CHAR, RBRACKET / CHAR]
fn yy_state_13(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_CHAR => Shift(yy_state_8)
    NT_character_class_item => Shift(yy_state_11)
    NT_character_class_inner => Shift(yy_state_14)
    _ => Error
  }
}

// [33, character_class → LBRACKET CARET character_class_inner • RBRACKET, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_14(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_15)
    _ => Error
  }
}

// [33, character_class → LBRACKET CARET character_class_inner RBRACKET •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_15(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_character_class, yy_action_33)
}

// [32, character_class → LBRACKET character_class_inner • RBRACKET, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_16(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_17)
    _ => Error
  }
}

// [32, character_class → LBRACKET character_class_inner RBRACKET •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_17(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_character_class, yy_action_35)
}

// [31, atom → EOF •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_18(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atom, yy_action_4)
}

// [30, atom → UNDERSCORE •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_19(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atom, yy_action_13)
}

// [29, atom → STRING •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_20(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atom, yy_action_20)
}

// [28, atom → CHAR •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_21(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atom, yy_action_17)
}

// [27, atom → LC_IDENT •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_22(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atom, yy_action_1)
}

// [26, atom → character_class •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_23(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atom, yy_action_21)
}

// [17, alternation → • concatenation, RPAREN]
// [18, alternation → • concatenation BAR alternation, RPAREN]
// [19, concatenation → • repetition, RPAREN / BAR]
// [20, concatenation → • repetition concatenation, RPAREN / BAR]
// [21, repetition → • atom, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / LC_IDENT / CHAR / STRING]
// [22, repetition → • atom STAR, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / LC_IDENT / CHAR / STRING]
// [23, repetition → • atom PLUS, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / LC_IDENT / CHAR / STRING]
// [24, repetition → • atom QUESTION, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / LC_IDENT / CHAR / STRING]
// [25, atom → • LPAREN alternation RPAREN, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [25, atom → LPAREN • alternation RPAREN, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [26, atom → • character_class, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [27, atom → • LC_IDENT, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [28, atom → • CHAR, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [29, atom → • STRING, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [30, atom → • UNDERSCORE, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [31, atom → • EOF, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [32, character_class → • LBRACKET character_class_inner RBRACKET, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [33, character_class → • LBRACKET CARET character_class_inner RBRACKET, EOF / UNDERSCORE / LPAREN / RPAREN / LBRACKET / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_24(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_7)
    T_EOF => Shift(yy_state_18)
    T_UNDERSCORE => Shift(yy_state_19)
    T_STRING => Shift(yy_state_20)
    T_CHAR => Shift(yy_state_21)
    T_LC_IDENT => Shift(yy_state_22)
    NT_character_class => Shift(yy_state_23)
    T_LPAREN => Shift(yy_state_24)
    NT_alternation => Shift(yy_state_25)
    NT_atom => Shift(yy_state_27)
    NT_repetition => Shift(yy_state_31)
    NT_concatenation => Shift(yy_state_33)
    _ => Error
  }
}

// [25, atom → LPAREN alternation • RPAREN, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_25(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_26)
    _ => Error
  }
}

// [25, atom → LPAREN alternation RPAREN •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_26(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_atom, yy_action_3)
}

// [21, repetition → atom •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [22, repetition → atom • STAR, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [23, repetition → atom • PLUS, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [24, repetition → atom • QUESTION, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
fn yy_state_27(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_QUESTION => Shift(yy_state_28)
    T_PLUS => Shift(yy_state_29)
    T_STAR => Shift(yy_state_30)
    T_EOF | T_AS | T_UNDERSCORE | T_LPAREN | T_RPAREN | T_LBRACKET | T_SEMICOLON | T_FAT_ARROW | T_BAR | T_LC_IDENT | T_CHAR | T_STRING => Reduce(1, NT_repetition, yy_action_9)
    _ => Error
  }
}

// [24, repetition → atom QUESTION •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
fn yy_state_28(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_repetition, yy_action_15)
}

// [23, repetition → atom PLUS •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
fn yy_state_29(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_repetition, yy_action_29)
}

// [22, repetition → atom STAR •, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
fn yy_state_30(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_repetition, yy_action_22)
}

// [19, concatenation → • repetition, AS / RPAREN / SEMICOLON / FAT_ARROW / BAR]
// [19, concatenation → repetition •, AS / RPAREN / SEMICOLON / FAT_ARROW / BAR]
// [20, concatenation → • repetition concatenation, AS / RPAREN / SEMICOLON / FAT_ARROW / BAR]
// [20, concatenation → repetition • concatenation, AS / RPAREN / SEMICOLON / FAT_ARROW / BAR]
// [21, repetition → • atom, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [22, repetition → • atom STAR, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [23, repetition → • atom PLUS, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [24, repetition → • atom QUESTION, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [25, atom → • LPAREN alternation RPAREN, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [26, atom → • character_class, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [27, atom → • LC_IDENT, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [28, atom → • CHAR, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [29, atom → • STRING, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [30, atom → • UNDERSCORE, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [31, atom → • EOF, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [32, character_class → • LBRACKET character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [33, character_class → • LBRACKET CARET character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_31(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_7)
    T_EOF => Shift(yy_state_18)
    T_UNDERSCORE => Shift(yy_state_19)
    T_STRING => Shift(yy_state_20)
    T_CHAR => Shift(yy_state_21)
    T_LC_IDENT => Shift(yy_state_22)
    NT_character_class => Shift(yy_state_23)
    T_LPAREN => Shift(yy_state_24)
    NT_atom => Shift(yy_state_27)
    NT_repetition => Shift(yy_state_31)
    NT_concatenation => Shift(yy_state_32)
    T_AS | T_RPAREN | T_SEMICOLON | T_FAT_ARROW | T_BAR => Reduce(1, NT_concatenation, yy_action_31)
    _ => Error
  }
}

// [20, concatenation → repetition concatenation •, AS / RPAREN / SEMICOLON / FAT_ARROW / BAR]
fn yy_state_32(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_concatenation, yy_action_30)
}

// [17, alternation → concatenation •, AS / RPAREN / SEMICOLON / FAT_ARROW]
// [18, alternation → concatenation • BAR alternation, AS / RPAREN / SEMICOLON / FAT_ARROW]
fn yy_state_33(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_BAR => Shift(yy_state_34)
    T_AS | T_RPAREN | T_SEMICOLON | T_FAT_ARROW => Reduce(1, NT_alternation, yy_action_28)
    _ => Error
  }
}

// [17, alternation → • concatenation, AS / RPAREN / SEMICOLON / FAT_ARROW]
// [18, alternation → • concatenation BAR alternation, AS / RPAREN / SEMICOLON / FAT_ARROW]
// [18, alternation → concatenation BAR • alternation, AS / RPAREN / SEMICOLON / FAT_ARROW]
// [19, concatenation → • repetition, AS / RPAREN / SEMICOLON / FAT_ARROW / BAR]
// [20, concatenation → • repetition concatenation, AS / RPAREN / SEMICOLON / FAT_ARROW / BAR]
// [21, repetition → • atom, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [22, repetition → • atom STAR, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [23, repetition → • atom PLUS, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [24, repetition → • atom QUESTION, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [25, atom → • LPAREN alternation RPAREN, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [26, atom → • character_class, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [27, atom → • LC_IDENT, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [28, atom → • CHAR, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [29, atom → • STRING, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [30, atom → • UNDERSCORE, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [31, atom → • EOF, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [32, character_class → • LBRACKET character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [33, character_class → • LBRACKET CARET character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / RPAREN / LBRACKET / SEMICOLON / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_34(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_7)
    T_EOF => Shift(yy_state_18)
    T_UNDERSCORE => Shift(yy_state_19)
    T_STRING => Shift(yy_state_20)
    T_CHAR => Shift(yy_state_21)
    T_LC_IDENT => Shift(yy_state_22)
    NT_character_class => Shift(yy_state_23)
    T_LPAREN => Shift(yy_state_24)
    NT_atom => Shift(yy_state_27)
    NT_repetition => Shift(yy_state_31)
    NT_concatenation => Shift(yy_state_33)
    NT_alternation => Shift(yy_state_35)
    _ => Error
  }
}

// [18, alternation → concatenation BAR alternation •, AS / RPAREN / SEMICOLON / FAT_ARROW]
fn yy_state_35(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_alternation, yy_action_25)
}

// [15, alias → alternation •, SEMICOLON / FAT_ARROW]
// [16, alias → alternation • AS LC_IDENT, SEMICOLON / FAT_ARROW]
fn yy_state_36(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_AS => Shift(yy_state_37)
    T_SEMICOLON | T_FAT_ARROW => Reduce(1, NT_alias, yy_action_24)
    _ => Error
  }
}

// [16, alias → alternation AS • LC_IDENT, SEMICOLON / FAT_ARROW]
fn yy_state_37(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LC_IDENT => Shift(yy_state_38)
    _ => Error
  }
}

// [16, alias → alternation AS LC_IDENT •, SEMICOLON / FAT_ARROW]
fn yy_state_38(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_alias, yy_action_34)
}

// [14, regex → alias •, SEMICOLON / FAT_ARROW]
fn yy_state_39(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_regex, yy_action_5)
}

// [7, named_regexe → LET LC_IDENT EQ regex • SEMICOLON, $ / LET / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_40(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_SEMICOLON => Shift(yy_state_41)
    _ => Error
  }
}

// [7, named_regexe → LET LC_IDENT EQ regex SEMICOLON •, $ / LET / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_41(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_named_regexe, yy_action_23)
}

// [5, named_regex_list → • named_regexe named_regex_list, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
// [5, named_regex_list → named_regexe • named_regex_list, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
// [6, named_regex_list → •, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
// [7, named_regexe → • LET LC_IDENT EQ regex SEMICOLON, $ / LET / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_42(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LET => Shift(yy_state_4)
    NT_named_regexe => Shift(yy_state_42)
    NT_named_regex_list => Shift(yy_state_43)
    T_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE | T_LBRACE_CODE_RBRACE | EOI => Reduce(0, NT_named_regex_list, yy_action_37)
    _ => Error
  }
}

// [5, named_regex_list → named_regexe named_regex_list •, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_43(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_named_regex_list, yy_action_10)
}

// [0, lex → header named_regex_list • rule_list trailer, $]
// [8, rule_list → • rule rule_list, $ / LBRACE_CODE_RBRACE]
// [9, rule_list → •, $ / LBRACE_CODE_RBRACE]
// [10, rule → • RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE PARSE_LBRACE rule_item_list RBRACE RBRACE, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_44(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE => Shift(yy_state_45)
    NT_rule => Shift(yy_state_55)
    NT_rule_list => Shift(yy_state_57)
    T_LBRACE_CODE_RBRACE | EOI => Reduce(0, NT_rule_list, yy_action_14)
    _ => Error
  }
}

// [10, rule → RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE • PARSE_LBRACE rule_item_list RBRACE RBRACE, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_45(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PARSE_LBRACE => Shift(yy_state_46)
    _ => Error
  }
}

// [10, rule → RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE PARSE_LBRACE • rule_item_list RBRACE RBRACE, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
// [11, rule_item_list → • rule_item rule_item_list, RBRACE]
// [12, rule_item_list → •, RBRACE]
// [13, rule_item → • regex FAT_ARROW LBRACE_CODE_RBRACE, EOF / UNDERSCORE / RBRACE / LPAREN / LBRACKET / LC_IDENT / CHAR / STRING]
// [14, regex → • alias, FAT_ARROW]
// [15, alias → • alternation, FAT_ARROW]
// [16, alias → • alternation AS LC_IDENT, FAT_ARROW]
// [17, alternation → • concatenation, AS / FAT_ARROW]
// [18, alternation → • concatenation BAR alternation, AS / FAT_ARROW]
// [19, concatenation → • repetition, AS / FAT_ARROW / BAR]
// [20, concatenation → • repetition concatenation, AS / FAT_ARROW / BAR]
// [21, repetition → • atom, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [22, repetition → • atom STAR, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [23, repetition → • atom PLUS, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [24, repetition → • atom QUESTION, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [25, atom → • LPAREN alternation RPAREN, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [26, atom → • character_class, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [27, atom → • LC_IDENT, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [28, atom → • CHAR, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [29, atom → • STRING, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [30, atom → • UNDERSCORE, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [31, atom → • EOF, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [32, character_class → • LBRACKET character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [33, character_class → • LBRACKET CARET character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_46(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_7)
    T_EOF => Shift(yy_state_18)
    T_UNDERSCORE => Shift(yy_state_19)
    T_STRING => Shift(yy_state_20)
    T_CHAR => Shift(yy_state_21)
    T_LC_IDENT => Shift(yy_state_22)
    NT_character_class => Shift(yy_state_23)
    T_LPAREN => Shift(yy_state_24)
    NT_atom => Shift(yy_state_27)
    NT_repetition => Shift(yy_state_31)
    NT_concatenation => Shift(yy_state_33)
    NT_alternation => Shift(yy_state_36)
    NT_alias => Shift(yy_state_39)
    NT_regex => Shift(yy_state_47)
    NT_rule_item => Shift(yy_state_50)
    NT_rule_item_list => Shift(yy_state_52)
    T_RBRACE => Reduce(0, NT_rule_item_list, yy_action_2)
    _ => Error
  }
}

// [13, rule_item → regex • FAT_ARROW LBRACE_CODE_RBRACE, EOF / UNDERSCORE / RBRACE / LPAREN / LBRACKET / LC_IDENT / CHAR / STRING]
fn yy_state_47(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_48)
    _ => Error
  }
}

// [13, rule_item → regex FAT_ARROW • LBRACE_CODE_RBRACE, EOF / UNDERSCORE / RBRACE / LPAREN / LBRACKET / LC_IDENT / CHAR / STRING]
fn yy_state_48(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACE_CODE_RBRACE => Shift(yy_state_49)
    _ => Error
  }
}

// [13, rule_item → regex FAT_ARROW LBRACE_CODE_RBRACE •, EOF / UNDERSCORE / RBRACE / LPAREN / LBRACKET / LC_IDENT / CHAR / STRING]
fn yy_state_49(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_rule_item, yy_action_19)
}

// [11, rule_item_list → • rule_item rule_item_list, RBRACE]
// [11, rule_item_list → rule_item • rule_item_list, RBRACE]
// [12, rule_item_list → •, RBRACE]
// [13, rule_item → • regex FAT_ARROW LBRACE_CODE_RBRACE, EOF / UNDERSCORE / RBRACE / LPAREN / LBRACKET / LC_IDENT / CHAR / STRING]
// [14, regex → • alias, FAT_ARROW]
// [15, alias → • alternation, FAT_ARROW]
// [16, alias → • alternation AS LC_IDENT, FAT_ARROW]
// [17, alternation → • concatenation, AS / FAT_ARROW]
// [18, alternation → • concatenation BAR alternation, AS / FAT_ARROW]
// [19, concatenation → • repetition, AS / FAT_ARROW / BAR]
// [20, concatenation → • repetition concatenation, AS / FAT_ARROW / BAR]
// [21, repetition → • atom, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [22, repetition → • atom STAR, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [23, repetition → • atom PLUS, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [24, repetition → • atom QUESTION, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / LC_IDENT / CHAR / STRING]
// [25, atom → • LPAREN alternation RPAREN, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [26, atom → • character_class, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [27, atom → • LC_IDENT, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [28, atom → • CHAR, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [29, atom → • STRING, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [30, atom → • UNDERSCORE, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [31, atom → • EOF, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [32, character_class → • LBRACKET character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
// [33, character_class → • LBRACKET CARET character_class_inner RBRACKET, EOF / AS / UNDERSCORE / LPAREN / LBRACKET / FAT_ARROW / BAR / STAR / PLUS / QUESTION / LC_IDENT / CHAR / STRING]
fn yy_state_50(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_7)
    T_EOF => Shift(yy_state_18)
    T_UNDERSCORE => Shift(yy_state_19)
    T_STRING => Shift(yy_state_20)
    T_CHAR => Shift(yy_state_21)
    T_LC_IDENT => Shift(yy_state_22)
    NT_character_class => Shift(yy_state_23)
    T_LPAREN => Shift(yy_state_24)
    NT_atom => Shift(yy_state_27)
    NT_repetition => Shift(yy_state_31)
    NT_concatenation => Shift(yy_state_33)
    NT_alternation => Shift(yy_state_36)
    NT_alias => Shift(yy_state_39)
    NT_regex => Shift(yy_state_47)
    NT_rule_item => Shift(yy_state_50)
    NT_rule_item_list => Shift(yy_state_51)
    T_RBRACE => Reduce(0, NT_rule_item_list, yy_action_2)
    _ => Error
  }
}

// [11, rule_item_list → rule_item rule_item_list •, RBRACE]
fn yy_state_51(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_rule_item_list, yy_action_11)
}

// [10, rule → RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE PARSE_LBRACE rule_item_list • RBRACE RBRACE, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_52(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_53)
    _ => Error
  }
}

// [10, rule → RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE PARSE_LBRACE rule_item_list RBRACE • RBRACE, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_53(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_54)
    _ => Error
  }
}

// [10, rule → RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE PARSE_LBRACE rule_item_list RBRACE RBRACE •, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_54(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_rule, yy_action_27)
}

// [8, rule_list → • rule rule_list, $ / LBRACE_CODE_RBRACE]
// [8, rule_list → rule • rule_list, $ / LBRACE_CODE_RBRACE]
// [9, rule_list → •, $ / LBRACE_CODE_RBRACE]
// [10, rule → • RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE PARSE_LBRACE rule_item_list RBRACE RBRACE, $ / RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE / LBRACE_CODE_RBRACE]
fn yy_state_55(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE => Shift(yy_state_45)
    NT_rule => Shift(yy_state_55)
    NT_rule_list => Shift(yy_state_56)
    T_LBRACE_CODE_RBRACE | EOI => Reduce(0, NT_rule_list, yy_action_14)
    _ => Error
  }
}

// [8, rule_list → rule rule_list •, $ / LBRACE_CODE_RBRACE]
fn yy_state_56(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_rule_list, yy_action_0)
}

// [0, lex → header named_regex_list rule_list • trailer, $]
// [3, trailer → • LBRACE_CODE_RBRACE, $]
// [4, trailer → •, $]
fn yy_state_57(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACE_CODE_RBRACE => Shift(yy_state_58)
    NT_trailer => Shift(yy_state_59)
    EOI => Reduce(0, NT_trailer, yy_action_16)
    _ => Error
  }
}

// [3, trailer → LBRACE_CODE_RBRACE •, $]
fn yy_state_58(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_trailer, yy_action_32)
}

// [0, lex → header named_regex_list rule_list trailer •, $]
fn yy_state_59(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_lex, yy_action_7)
}

fn yy_parse[T](
  tokens : Array[(Token, Position, Position)],
  start : YYState,
  return_ : (YYObj) -> T,
  initial_pos? : Position,
) -> T!ParseError {
  let mut cursor = 0
  let mut state_stack : @immut/list.T[YYState] = Cons(start, Nil)
  let data_stack : Array[(YYObj, Position, Position)] = []
  let mut last_pos = initial_pos.or(tokens[0].1)
  let mut state = start
  let mut lookahead : Option[(YYSymbol, (YYObj, Position, Position), Token?)] = None
  let mut last_shifted_state_stack = state_stack
  while true {
    let decision = match state(EOI) {
      ReduceNoLookahead(_) | Accept as t => t
      _ => {
        match lookahead {
          Some(la) => state(la.0)
          None => {
            if cursor < tokens.length() {
              let (token, start_pos, end_pos) = tokens[cursor]
              cursor += 1
              let (symbol, data) = yy_input(token, start_pos, end_pos)
              lookahead = Some((symbol, (data, start_pos, end_pos), Some(token)))
              state(symbol)
            } else {
              lookahead = Some((EOI, (YYObj_Void, last_pos, last_pos), None))
              state(EOI)
            }
          }
        }
      }
    }
    match decision {
      Accept => return return_(data_stack.unsafe_pop().0)
      Shift(next_state) => {
        guard lookahead is Some(la)
        data_stack.push(la.1)
        state_stack = Cons(next_state, state_stack)
        last_shifted_state_stack = state_stack
        state = next_state
        last_pos = la.1.2
        lookahead = None
      }
      Reduce(count, symbol, action)
      | ReduceNoLookahead(count, symbol, action) => {
        loop (count, symbol, action) {
          _ => {
            let args = data_stack[data_stack.length() - count:]
            let data = action(last_pos, args)
            let (start_pos, end_pos) = if args.length() == 0 {
              (last_pos, last_pos)
            } else {
              (args[0].1, args[args.length() - 1].2)
            }
            for i in 0..<count {
              ignore(data_stack.unsafe_pop())
              state_stack = state_stack.tail()
            }
            state = state_stack.unsafe_head()
            data_stack.push((data, start_pos, end_pos))
            match state(symbol) {
              Accept => return return_(data_stack.unsafe_pop().0)
              Shift(next_state) => {
                state_stack = Cons(next_state, state_stack)
                state = next_state
              }
              Reduce(count, symbol, action)
              | ReduceNoLookahead(count, symbol, action) => continue (count, symbol, action)
              _ => panic()
            }
          }
        }
      }
      Error => {
        let (_, (_, start_pos, end_pos), token) = lookahead.unwrap()
        error!(last_shifted_state_stack, token, (start_pos, end_pos))
      }
    }
  }
  panic()
}

fn error(stack : @immut/list.T[YYState], token : Token?, loc : (Position, Position)) -> Unit!ParseError {
  let expected = []
  fn try_add(symbol : YYSymbol, kind : TokenKind) {
    fn go(stack : @immut/list.T[YYState]) {
      match stack {
        Nil => ()
        Cons(state, _) => {
          match state(symbol) {
            Accept | Shift(_) => expected.push(kind)
            Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) => {
              fn inner_go(stack : @immut/list.T[YYState], count, symbol) {
                let stack = stack.drop(count)
                guard stack is Cons(state, _)
                match state(symbol) {
                  Shift(state) => go(Cons(state, stack))
                  Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) => inner_go(stack, count, symbol)
                  _ => panic()
                }
              }
              inner_go(stack, count, symbol)
            }
            Error => ()
          }
        }
      }
    }
    go(stack)
  }
  for term in ([(T_EOF, TK_EOF), (T_PARSE_LBRACE, TK_PARSE_LBRACE), (T_LET, TK_LET), (T_AS, TK_AS), (T_UNDERSCORE, TK_UNDERSCORE), (T_RBRACE, TK_RBRACE), (T_LPAREN, TK_LPAREN), (T_RPAREN, TK_RPAREN), (T_LBRACKET, TK_LBRACKET), (T_RBRACKET, TK_RBRACKET), (T_EQ, TK_EQ), (T_SEMICOLON, TK_SEMICOLON), (T_FAT_ARROW, TK_FAT_ARROW), (T_BAR, TK_BAR), (T_STAR, TK_STAR), (T_PLUS, TK_PLUS), (T_QUESTION, TK_QUESTION), (T_MINUS, TK_MINUS), (T_CARET, TK_CARET), (T_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE, TK_RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE), (T_LBRACE_CODE_RBRACE, TK_LBRACE_CODE_RBRACE), (T_LC_IDENT, TK_LC_IDENT), (T_CHAR, TK_CHAR), (T_STRING, TK_STRING)] : Array[(YYSymbol, TokenKind)]) {
    try_add(term.0, term.1)
  }
  match token {
    None => raise UnexpectedEndOfInput(loc.1, expected)
    Some(token) => raise UnexpectedToken(token, loc, expected)
  }
}

pub fn lex(tokens : Array[(Token, Position, Position)], initial_pos? : Position) -> Unit!ParseError {
  yy_parse!(
    tokens,
    yy_state_0,
    fn {
      YYObj_Unit(result) => result
      _ => panic()
    },
    initial_pos?,
  )
}
