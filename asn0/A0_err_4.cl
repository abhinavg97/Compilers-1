Class Main inherits IO{

	 a:Int  <-5;
	main() : Object{

		If (faLsE) -- True , False are  case sensitive (the first letter must be be small )
		ThEn out_string("Hello\n")   -- all other key words are not case sensitive
		else if(TRue)                 -- error,invalid keyword
		then out_string("Yes\n")
		else 
		out_string("Nothing!\n")
		FI Fi                        -- valid keywords
	};
};