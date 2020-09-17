# COOL Compiler #

Parser for COOL Compiler, 

-- Reports parsing errors if any 
-- All the grammar rules written are as per the cool manual
-- In the test cases, several cases of lexical analysis and parsing are taken care of
-- In lexical analysis , unterminated string constants , unescaped newlines , EOF in comments , EOF in string 	 constants,escaped backslashes are taken care of 
-- In parsing , grammar errors like replacing object id with type id , missing semicolons , missing brackets 	and other grammar rules are taken care of
-- Syntactically and programs with no parsing errors are successfully parsed and appropriate message is shown
-- Otherwise antlr automatically shows the appropriate error message of the error encountered
