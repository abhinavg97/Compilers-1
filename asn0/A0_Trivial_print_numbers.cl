(*
Given a number , prints the numbers from that number to 1;
*)
class Main inherits IO{

	n :Int ;
	a:Number <- (new Number);
	main() : Object {
		
	{
		out_string("Enter the number:");
		n<- in_int();
		a.num(n);
	}			
	};
};



class Number inherits IO
{
	num(a:Int) :Object
	{
		while 0 < a
		loop
		{
			out_int(a);
			out_string("\n");
			a <- a-1;
		}
		pool	
	};
};
