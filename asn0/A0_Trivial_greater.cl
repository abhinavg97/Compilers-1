(*
Given two numbers m prints the larger of the two
*)
class Main inherits IO{
	n1 : Int;
	n2 : Int;
	choice :Int;
	greater : Greater <- (new Greater);
	main() :Object{
		{
			while (true)
			loop
			{
				out_string("Continue?(0/1): ");
				choice<-in_int(); 
				if(choice=1)
				then{
					out_string("Enter two numbers :\n");
					n1<-in_int();
					n2<-in_int();
					out_string("The greater integer is : ");
					greater.print(n1,n2);
					out_string("\n");
				}
				else abort()
				fi;
			}
			pool;
		}
	};
};

class Greater inherits IO{
	print(n1: Int ,n2:Int) :Object{
		if(n1<n2) 
		then out_int(n2)
		else out_int(n1)
		fi 
	};
};