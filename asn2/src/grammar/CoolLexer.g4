lexer grammar CoolLexer;

tokens{
	ERROR,
	TYPEID,
	OBJECTID,
	BOOL_CONST,
	INT_CONST,
	STR_CONST,
	LPAREN,
	RPAREN,
	COLON,
	ATSYM,
	SEMICOLON,
	COMMA,
	PLUS,
	MINUS,
	STAR,
	SLASH,
	TILDE,
	LT,
	EQUALS,
	LBRACE,
	RBRACE,
	DOT,
	DARROW,
	LE,
	ASSIGN,
	CLASS,
	ELSE,
	FI,
	IF,
	IN,
	INHERITS,
	LET,
	LOOP,
	POOL,
	THEN,
	WHILE,
	CASE,
	ESAC,
	OF,
	NEW,
	ISVOID,
	NOT
}

/*
  DO NOT EDIT CODE ABOVE THIS LINE
*/

@members{

	/*
		YOU CAN ADD YOUR MEMBER VARIABLES AND METHODS HERE
	*/

	/**
	* Function to report errors.
	* Use this function whenever your lexer encounters any erroneous input
	* DO NOT EDIT THIS FUNCTION
	*/

	// method for reporting error of unrecognized tokens
	public void reportTokenError(String errorString){   
		Token t = _factory.create(_tokenFactorySourcePair, _type, _text, _channel, _tokenStartCharIndex, getCharIndex()-1, _tokenStartLine, _tokenStartCharPositionInLine);
		String text = t.getText();
		setText(errorString+text);
		setType(ERROR);
	}
	public void reportError(String errorString){
		setText(errorString);
		setType(ERROR);
	}

	public void processString(){																	// function to remove extra '\' from the processed string (in case of escaped chars)
		Token t = _factory.create(_tokenFactorySourcePair, _type, _text, _channel, _tokenStartCharIndex, getCharIndex()-1, _tokenStartLine, _tokenStartCharPositionInLine);
		String text = t.getText();
		String text_ = "";
		for(int i = 0;i < text.length();++i){
			if(text.charAt(i) == '\\'){        // if there is an escape character in the string, we have to convert the special symbol into one token instead of two
				++i;
				if(text.charAt(i) == 'n'){         
					text_ += '\n';         // newline token
				}
				else if(text.charAt(i) == 't'){
					text_ += '\t';             // tab token
				}
				else if(text.charAt(i) == 'b'){
					text_ += '\b';                // backspace token
				}
				else if(text.charAt(i) == 'f'){
					text_ += '\f';                // formfeed token
				}
				else{
					text_ += text.charAt(i);       // Note : charcters " and / are added with an escape character in the final string as a single token
				}
			}
			else if(text.charAt(i) == '"'){
					text_ += "";                     // if a double quote is encountered , append an empty string
			}
			else{
				text_ += text.charAt(i);            
			}
		}
		if(text_.length()>1024) {                        // if the string after reducing special characters as single tokens exceeds the max limit , report error
			reportError("String constant too long");
			return ;
		}
		setText(text_);
	}
}

/*
	WRITE ALL LEXER RULES BELOW
*/

// Have to keep keywords above in the sequence as otherwise the tokens get matched to object id or typeid




// tokens of special keywords  they are case insensitive , we could have done this with fragments too !

CLASS		: ('c'|'C') ('l'|'L') ('a'|'A') ('s'|'S') ('s'|'S');
BOOL_CONST	: 't' ('r'|'R') ('u'|'U') ('e'|'E')
			| 'f' ('a'|'A') ('l'|'L') ('s'|'S') ('e'|'E') ;
ELSE		: ('e'|'E') ('l'|'L') ('s'|'S') ('e'|'E') ;
FI			: ('f'|'F') ('i'|'I') ;
IF			: ('i'|'I') ('f'|'F') ;
IN			: ('i'|'I') ('n'|'N') ;
INHERITS	: ('i'|'I') ('n'|'N') ('h'|'H') ('e'|'E') ('r'|'R') ('i'|'I') ('t'|'T') ('s'|'S') ;
LET			: ('l'|'L') ('e'|'E') ('t'|'T') ;
LOOP		: ('l'|'L') ('o'|'O') ('o'|'O') ('p'|'P') ;
POOL		: ('p'|'P') ('o'|'O') ('o'|'O') ('l'|'L') ;
THEN		: ('t'|'T') ('h'|'H') ('e'|'E') ('n'|'N') ;
WHILE		: ('w'|'W') ('h'|'H') ('i'|'I') ('l'|'L') ('e'|'E') ;
CASE		: ('c'|'C') ('a'|'A') ('s'|'S') ('e'|'E') ;
ESAC		: ('e'|'E') ('s'|'S') ('a'|'A') ('c'|'C') ;
OF			: ('o'|'O') ('f'|'F') ;
NEW			: ('n'|'N') ('e'|'E') ('w'|'W') ;
ISVOID		: ('i'|'I') ('s'|'S') ('v'|'V') ('o'|'O') ('i'|'I') ('d'|'D') ;
NOT			: ('n'|'N') ('o'|'O') ('t'|'T') ;

// tokens of special types if they get matched in our program source code
// we place object id and type id below special keywords as those might get matched in this instead
TYPEID      : [A-Z][0-9_A-Za-z]* ;
OBJECTID    : [a-z][0-9_A-Za-z]* ;
INT_CONST   : [0-9]+;

// Tokens of special characters

LPAREN      : '(';
RPAREN      : ')';
COLON       : ':';
ATSYM       : '@';
SEMICOLON   : ';';
COMMA       : ',';
PLUS        : '+';    
MINUS       : '-';
STAR        : '*';
SLASH       : '/';
TILDE       : '~';
LT          : '<';
EQUALS      : '=';
LBRACE      : '{';
RBRACE      : '}';
DOT         : '.';
DARROW      : '=>';  
LE          : '<=';
ASSIGN      : '<-'; 

// Token of white spaces

WS			: [ \t\r\n\f\v]+ -> skip ;


			// If the string contains null character , this pattern get matched 
			// EOF in string constant  if we encounter EOF before we encounter a 
			//closing double quote, escaped newlines are taken care of
      		//	   escaped double quote and escaped backslash is taken care of
ERROR		: '"' ((~["EOF\n]) | (('\\\n')|('\\"')|('\\\\')))*  ('\\u0000')((~["EOF\n]) | (('\\\n')|('\\"')|('\\\\')))* (EOF|'"'|'\n'){ reportError("String contains null character"); }
			| '"' ((~["EOF\n]) | (('\\\n')|('\\"')|('\\\\')))*  (EOF)    { reportError("EOF in string literal"); }
			| '"' ((~["EOF\n]) | (('\\\n')|('\\"')|('\\\\')))*  ('\n') { reportError("Unterminated string constant"); }
			; 


// After handling the above errors for string constants , we get a valid string if we get matched to the below 
// pattern (string too long is handled in processString) , escaped double quote("...\"...")
// and escaped backslash ("....\\") is handled here

STR_CONST	: '"' ((~["EOF\n])| (('\\\n')|('\\"')|('\\\\')))* '"' { processString() ;} ;



// If nothing get recognized in the above tokens then report unrecognized token error
TOKENERROR  :   (.)  {reportTokenError("TOKEN NOT RECOGNIZED : ");};


// Line Comment  , skip anything inside comments until we get an EOF or a newline 
LINE_COMMENT  : ('--' (.)*? ('\n'|EOF)) -> skip ;

// If we get a EOF after starting the comment , report EOF in comment error
EOF_COMM      : '(*' EOF {reportError("EOF in Comment");};

// If we encounter starting comment sequence , go into the mode Comments , and skip the matched (* characters
BEGIN_COMMENT : '(*' -> pushMode(COMMENT),skip;

// all the errors related to this comment is handled inside the comment mode
//Afer we come out of the comments mode means all the previous comment tokens are properly matched
//Now if we encounter a closing comment token , report error of unmatched *) as there was no matching (* comment sequence

ERR_END_COMM  : '*)' {reportError(" Unmatched *) ");};


/*
mode describes a seperate set of rules to be ollowed inside it , it follows a stack type of operation ,
here pushing if we encounter a opening comment((*) and popping if we encounter a closing comment (*))
the mode exits only when the stack is empty , otherwise we report a error using the Java method reportError
we skip any characters inside the comments , if we encounter an EOF inside this mode , we report EOF in comment error
if we encounter EOF in the mode after enountering a opening (* token we report EOF in comment error
*/

mode COMMENT;

EOF_ERR          : . EOF {reportError("EOF in Comment");};	// If we encounter EOF , report EOF in commets error 
CHARS            : (.|'\n')   -> skip;           //skipping any character inside the comments 
EOF_ERR1          : '(*' EOF {reportError("EOF in Comment");};
START_IN_COMM    : '(*' -> pushMode(COMMENT),skip;      // skipping the (* charcters and pushing to the stack
END_COMM         :  '*)' -> popMode,skip;            // popping from the stack if we encounter *) and skipping *)


// We exit from the mode only when the stack gets empty