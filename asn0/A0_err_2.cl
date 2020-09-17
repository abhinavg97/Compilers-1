Class Main inherits IO{

	a : String ;
	b:String;
	c:String;
	d:String;
	main() :Object{
		{
			a <- 'hello Abhi';  -- error , Strings are enclosed in double quotes "...".
		
			b<-"This \
			 is ok\n";
					
	   		c<-"This is not 
					OK"; --A non-escaped newline character may not appear in a string:

			d <- "\0  ;    --error, A string may not contain eof
			out_string(d);
		}
	};
};