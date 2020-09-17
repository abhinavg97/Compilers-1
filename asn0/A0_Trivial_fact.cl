(*
Given a number calculates the factorial of the number iteratively
*)

Class Main inherits IO
{
	n:Int;
	fact : Fact <- (new Fact);
	main() :Object{
		{
			out_string("Enter the number:");
			n<-in_int();

			out_string("\nThe factorial is :" );
			out_int(fact.cal(n));
			out_string("\n");
		}
	};
};


Class Fact
{
	i :Int;
	total:Int<-1;
	cal(n:Int):Int{
		{
			i<-n;
			while(0<i)
			loop
			{
				total<-total*i;
				i<-i-1;
			}
			pool;
			total;
		}

	};
};