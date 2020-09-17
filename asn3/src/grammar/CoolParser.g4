parser grammar CoolParser;

options {
	tokenVocab = CoolLexer;
}

@header{
	import cool.AST;
	import java.util.List;
}

@members{
	String filename;
	public void setFilename(String f){
		filename = f;
	}

/*
	DO NOT EDIT THE FILE ABOVE THIS LINE
	Add member functions, variables below.
*/

}

/*
	Add Grammar rules and appropriate actions for building AST below.
*/

// Grammar for Cool , taken from cool manual

program : 
		(class_list) EOF 
		;

/* [[class]]+ */
class_list  :
			(class_ SEMICOLON )+
			;

class_  :
		/* class TYPE { [[feature]]* }	*/
		CLASS TYPEID (INHERITS TYPEID)? LBRACE  (feature SEMICOLON )* RBRACE
		;

feature  :
		/* ID: TYPE */
		(method)|(attr)
		;

attr :
	/* ID: TYPE [<- expr] */
	OBJECTID COLON TYPEID (ASSIGN expression)?
	;

method  :
		OBJECTID LPAREN (formal_list)? RPAREN COLON TYPEID LBRACE expression RBRACE
		;


formal_list :
			(formal) (COMMA formal )*
			;

formal  :
		OBJECTID COLON TYPEID
		;

/* [expr [[, expr]]* ] */
expression_list : expression  (COMMA  expression )* 
				;

expression  : 
 			/* ID <- expr */	
			OBJECTID ASSIGN expression  	
			/*expr[@TYPE].ID([expr [[, expr]]* ]) */	
			| expression (ATSYM TYPEID)? DOT OBJECTID LPAREN  (expression_list)? RPAREN  
			/*ID ( [expr [[, expr]]* ]) */
			| OBJECTID LPAREN expression_list RPAREN 
			/* if expr then expr else expr fi*/
			| IF expression THEN expression ELSE expression FI 
			/* while expr loop expr pool */
			| WHILE expression LOOP expression POOL
			/* { [[expr]]* } */
			| LBRACE 	(expression SEMICOLON )+ RBRACE	
			/* let ID:TYPE [[, ID : TYPE [<- expr]]]* in expr */
			| LET (attr)(COMMA attr)* IN expression
			/* case expr of [[ID : TYPE => expr;]]+ esac */
			| CASE expression OF (OBJECTID COLON TYPEID DARROW expression SEMICOLON)+ ESAC
			/* new TYPE */
			| NEW TYPEID
			/* isvoid expr */
			| ISVOID expression
			/* expr + expr */
			| expression PLUS expression
			/* expr - expr */
			| expression MINUS expression
			/* expr * expr */
			| expression STAR expression
			/* expr / expr */
			| expression SLASH expression
			/* ~ expr */
			| TILDE expression
			/* expr < expr */
			| expression LT expression
			/* expr <= expr */
			| expression LE expression
			/* expr = expr */
			| expression EQUALS expression
			/* not expr */
			| NOT expression
			/* (expr)	*/
			| LPAREN expression RPAREN
			/* ID */	
			| OBJECTID
			/* integer */
			| INT_CONST
			/* string */
			| STR_CONST
			/* true / false */
			| BOOL_CONST
			;