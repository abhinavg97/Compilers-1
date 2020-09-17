class StackCommand inherits StackOps{

	s :String;
	stack:String;

	input() : Bool {
		{
			out_string(">");
			s<-in_string();

			if(s="d") then 
			{
				display(stack);
				true;
			}

			else if(s="s") then
			{
				stack<-push(stack,"s");
				true;
			}

			else if(s="e") then 
			{
				stack<-evaluate(stack);
				true;
			}
			else if(s="+") then 
			{
				stack<-push(stack,"+");
				true;
			}
			else if(s= "x" ) then 
			{	
				false;
			}	
			else 
			{
				stack<-push(stack,s);
				true;
			}
			fi fi fi fi fi;
		}
	};

};

class StackOps inherits IO{

	str1 : String;
	str2 : String;
	str3 : String;
	length : Int;

	display(stack: String) : Object {
		{
			length<-stack.length();
			(let i:Int<-length-1 in 
				while(0<=i)
				loop
				{
					out_string(stack.substr(i,1));
					out_string("\n");
					i<-i-1;
				}
				pool
			);
		}
	};

	push(stack :String,element :String) : String{
		stack.concat(element)
	};

	swap(stack :String, str1:String,str2:String) : String{
		{
		stack <- push(stack,str1);
		stack <- push(stack,str2);
		stack;
		}
	};

	add(stack:String ,num1 : String, num2: String) :String{
		(let z :A2I <- new A2I in
			(let i:Int <- z.a2i(num1),j: Int <- z.a2i(num2) in
				stack<- push(stack,z.i2a(i+j))
				)
			)
	};

	evaluate(stack:String) : String{
		{
			length<-stack.length();	
			str1 <- stack.substr(length-1,1);
			if(str1="s") then
			{
				str2 <- stack.substr(length-2,1);
				str3 <- stack.substr(length-3,1);
				stack <- stack.substr(0,length-3);
				stack <- swap(stack,str2,str3);
				stack;
			}

			else if(str1="+") then
			{
				str2 <- stack.substr(length-2,1);
				str3 <- stack.substr(length-3,1);
				stack <- stack.substr(0,length-3);
				stack <- add(stack,str2,str3);
				stack;
			}

			else 	stack
			fi fi;
		}
	};
};

class A2I {

     c2i(char : String) : Int {
	if char = "0" then 0 else
	if char = "1" then 1 else
	if char = "2" then 2 else
        if char = "3" then 3 else
        if char = "4" then 4 else
        if char = "5" then 5 else
        if char = "6" then 6 else
        if char = "7" then 7 else
        if char = "8" then 8 else
        if char = "9" then 9 else
        { abort(); 0; }  -- the 0 is needed to satisfy the typchecker
        fi fi fi fi fi fi fi fi fi fi
     };

(*
   i2c is the inverse of c2i.
*)
     i2c(i : Int) : String {
	if i = 0 then "0" else
	if i = 1 then "1" else
	if i = 2 then "2" else
	if i = 3 then "3" else
	if i = 4 then "4" else
	if i = 5 then "5" else
	if i = 6 then "6" else
	if i = 7 then "7" else
	if i = 8 then "8" else
	if i = 9 then "9" else
	{ abort(); ""; }  -- the "" is needed to satisfy the typchecker
        fi fi fi fi fi fi fi fi fi fi
     };

(*
   a2i converts an ASCII string into an integer.  The empty string
is converted to 0.  Signed and unsigned strings are handled.  The
method aborts if the string does not represent an integer.  Very
long strings of digits produce strange answers because of arithmetic 
overflow.

*)
     a2i(s : String) : Int {
        if s.length() = 0 then 0 else
	if s.substr(0,1) = "-" then ~a2i_aux(s.substr(1,s.length()-1)) else
        if s.substr(0,1) = "+" then a2i_aux(s.substr(1,s.length()-1)) else
           a2i_aux(s)
        fi fi fi
     };

(*
  a2i_aux converts the usigned portion of the string.  As a programming
example, this method is written iteratively.
*)
     a2i_aux(s : String) : Int {
	(let int : Int <- 0 in	
           {	
               (let j : Int <- s.length() in
	          (let i : Int <- 0 in
		    while i < j loop
			{
			    int <- int * 10 + c2i(s.substr(i,1));
			    i <- i + 1;
			}
		    pool
		  )
	       );
              int;
	    }
        )
     };

(*
    i2a converts an integer to a string.  Positive and negative 
numbers are handled correctly.  
*)
    i2a(i : Int) : String {
	if i = 0 then "0" else 
        if 0 < i then i2a_aux(i) else
          "-".concat(i2a_aux(i * ~1)) 
        fi fi
    };
	
(*
    i2a_aux is an example using recursion.
*)		
    i2a_aux(i : Int) : String {
        if i = 0 then "" else 
	    (let next : Int <- i / 10 in
		i2a_aux(next).concat(i2c(i - next * 10))
	    )
        fi
    };

};


class Main{

	stack : StackCommand <-new StackCommand;
	condition : Bool <-true;
	main() :Object{

		while(condition) 
			loop 
			condition<-stack.input()
			pool
	};

};
