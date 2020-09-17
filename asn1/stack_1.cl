-- List code taken from List.cl from cool examples folder and A2I code taken from atoi.cl form the same folder

class List {
   -- Define operations on empty lists.

   isNil() : Bool { true };

   -- Since abort() has return type Object and head() has return type
   -- Int, we need to have an Int as the result of the method body,
   -- even though abort() never returns.

   head()  : String { { abort(); ""; } };

   -- As for head(), the self is just to make sure the return type of
   -- tail() is correct.

   tail()  : List { { abort(); self; } };

   -- When we cons and element onto the empty list we get a non-empty
   -- list. The (new Cons) expression creates a new list cell of class
   -- Cons, which is initialized by a dispatch to init().
   -- The result of init() is an element of class Cons, but it
   -- conforms to the return type List, because Cons is a subclass of
   -- List.

   cons(i : String) : List 
   {
      (new Cons).init(i, self)
   };

};


(*
 *  Cons inherits all operations from List. We can reuse only the cons
 *  method though, because adding an element to the front of an emtpy
 *  list is the same as adding it to the front of a non empty
 *  list. All other methods have to be redefined, since the behaviour
 *  for them is different from the empty list.
 *
 *  Cons needs two attributes to hold the integer of this list
 *  cell and to hold the rest of the list.
 *
 *  The init() method is used by the cons() method to initialize the
 *  cell.
 *)

class Cons inherits List {

   car : String;	-- The element in this list cell

   cdr : List;	-- The rest of the list

   isNil() : Bool { false };

   head()  : String { car };

   tail()  : List { cdr };

   init(i : String, rest : List) : List {
      {
    	 car <- i;
    	 cdr <- rest;
    	 self;
      }
   };

};

-- StackCommand which crates a stack object of the type list and inherits the operations from stackOps

class StackCommand inherits StackOps{

   s :String;
   stack:List<-new List;

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

-- StackOps class wherein the operations of the stack are defined (i.e display , evaluate , swap ,push and add)

class StackOps inherits IO{

   str1 : String;
   str2 : String;
   str3 : String;
   length : Int;

   display(l : List) : Object {
      if l.isNil() then out_string("")
      else {
         out_string(l.head());
         out_string("\n");
         display(l.tail());
      }
      fi
   };

   push(stack :List,element :String) : List{
      {
         stack<-stack.cons(element);
         stack;
      }
   };

   swap(stack :List, str1:String,str2:String) : List{
      {
      stack <- stack.cons(str1);
      stack <- stack.cons(str2);
      stack;
      }
   };

   add(stack:List ,num1 : String, num2: String) :List{
      (let z :A2I <- new A2I in
         (let i:Int <- z.a2i(num1),j: Int <- z.a2i(num2) in
            stack<- stack.cons(z.i2a(i+j))
            )
         )
   };

   evaluate(stack:List) : List{
      
        if(not (stack.isNil())) then
        {
         str1 <- stack.head();
         if(str1="s") then
         {
            stack<-stack.tail();
            str2 <- stack.head();
            stack<-stack.tail();
            str3 <- stack.head();
            stack<-stack.tail();
            stack <- swap(stack,str2,str3);
            stack;
         }

         else if(str1="+") then
         {
            stack<-stack.tail();
            str2 <- stack.head();
            stack<-stack.tail();
            str3 <- stack.head();
            stack<-stack.tail();
            stack <- add(stack,str2,str3);
            stack;
         }

         else  stack
         fi fi;
       }
       else stack
       fi
      
   };
};

-- A2I code taken from atoi.cl
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
  a2i(s : String) : Int 
  {
    if s.length() = 0 then 0  else
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
  i2a_aux(i : Int) : String 
  {
    if i = 0 then "" 
    else 
      (let next : Int <- i / 10 in
       i2a_aux(next).concat(i2c(i - next * 10))
      )
    fi
  };

};


class Main{

   stack : StackCommand <-new StackCommand;   -- Object of teh StackCommand class 
   condition : Bool <-true;
   main() :Object{

      while(condition)                            -- while condition is true ,loop, exit when false
         loop 
         condition<-stack.input()
         pool
   };

};
