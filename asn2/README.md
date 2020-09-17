# COOL Compiler #


Why the code is correct



Have kept keywords above in the sequence as otherwise the tokens get matched to object id or typeid

Tokens of special keywords  they are case insensitive , we could have done this with fragments too !

Tokens of special types if they get matched in our program source code
We place object id and type id below special keywords as those might get matched in this instead

In strings containing errors 

EOF in string constant  if we encounter EOF before we encounter a closing double quote, escaped newlines are taken care of
escaped double quote and escaped backslash is taken care of

While processing the string
if there is an escape character in the string, we have to convert the special symbol into one token instead of two

Note : charcters " and / are added with an escape character in the final string as a single token

If the string after reducing special characters as single tokens exceeds the max limit , report error

In comments

all the errors related to this comment is handled inside the comment mode
Afer we come out of the comments mode means all the previous comment tokens are properly matched
Now if we encounter a closing comment token , report error of unmatched *) as there was no matching (* comment sequence

if we encounter an EOF inside this mode , we report EOF in comment error
if we encounter EOF in the mode after enountering a opening (* token we report EOF in comment error

Why the test cases are adequate 

All the edge cases are covered in the test files , escaped newlines , escaped backslashes, and nested comments are handled appropriately
