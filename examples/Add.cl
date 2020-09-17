class Main inherits IO{

	i: Int;
	j:Int;
	choice :Int ;
	cal : Calc <- (new Calc);
	main() : Object {
		{
			out_string("1.Add\n2.Sub\n3.mul\n4.Div\nEnter the option:");
			choice<-int_int();
			case choice of
				1 : Int => 
				{
					i<-in_int();
					j<-in_int();
					out_int(cal.add(i,j));				
				};
				2 : Int => 
				{
					i<-in_int();
					j<-in_int();
					out_int(cal.subtract(i,j));				
				};
				3 : Int => 
				{
					i<-in_int();
					j<-in_int();
					out_int(cal.mul(i,j));				
				};
				4 : Int => 
				{
					i<-in_int();
					j<-in_int();
					out_int(cal.div(i,j));				
				};
			esac;
		}
	};
};

(*
case <expr0> of
<id1> : <type1> => <expr1>;
. . .
<idn> : <typen> => <exprn>;
esac
*)

class Calc inherits IO{


	add(i: Int , j :Int) :Int {
		i+j
	};

	subtract(i: Int,j:Int) : Int {
		i-j
	};

	mul(i:Int ,j:Int) :Int {
		i*j
	};

	div(i:Int ,j:Int) :Int {
		i/j
	};
};

