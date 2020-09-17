(*
Given a number calculates the nth fibbonaci number
*)

class Main inherits IO{
	
	fib: Fib <- (new Fib);
	n:Int;
	main() : Object 
	{
		{
			out_string("Enter the number :");
			n<-in_int();
			out_string("The fibo is ");
			out_int(fib.print(n));
			out_string("\n");
		}

	};
};

class Fib inherits IO {

	print(a: Int) :Int
	{
		let i:Int <- 3,p:Int <- 1,c :Int <- 1,n:Int<- 1 in 
		{
			while i<=a 
				loop {
					n<-c+p;
					p<-c;
					c<-n;
					i<-i+1;
				}
				pool;
				n;
		}
	}; 
};

