class Main {
	
	
	a : Int <- 0;
	
	--unescaped newline, unterminated string constant
	main() : Object 
	{
		{
			new IO.out_string("hello
				there");
		}
	};

	
};