Class Main inherits IO{

	a :Int ;                          
--	else : Int;                 -- error,    keywords cannot be identifiers. 
--	b :int;                      -- error , type indentifiers begin with caps
--	M: Cat <- (new Cat);        -- error , obj identifiers begin with small letters
	main():SELF_TYPE
	{
		{
			a <-;          -- error        , Integers are non-empty strings of digits 0-9
			out_int(a);
			self;
		}
	};
};


Class Cat{

	mouse:Int;
};