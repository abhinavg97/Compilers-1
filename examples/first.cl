class Main inherits IO{
	main() : Object {
	
	let a : Int <- 10 in  
	
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
