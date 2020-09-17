-- Program to evaluate cofactor , adjoint and determinant of a given 2X2 matrix

class Matrix inherits IO{       -- Matrix class 

	e1 : Int;       
	e2 : Int;
	e3 : Int;
	e4 : Int;

	input():Object{       -- method to take inputs for setting the values
		{
			e1 <- in_int();
			e2 <- in_int();
			e3 <- in_int();
			e4 <- in_int();
		}
	};

	setval( a: Int ,b:Int ,c:Int ,d : Int):Object{ -- Setting the value of data variables of an object
		{
			e1<-a;
			e2<-b;
			e3<-c;
			e4<-d;
		}
	};

	get_e1():Int {e1};      -- getting the values of the data variables of an object through methods
	get_e2():Int {e2};        -- since data variables are private in cool
	get_e3():Int {e3};
	get_e4():Int {e4};      

	print():Object{          -- method to print matrix
		{
			out_int(e1);
			out_string("  ");
			out_int(e2);
			out_string("\n");
			out_int(e3);
			out_string("  ");
			out_int(e4);
			out_string("\n");
		}
	};

	determinant() :Int{             -- method to evaluate det given a 2x2 matrix
		e1*e4-e2*e3
	};

};

class  Cal inherits IO        -- Cal class containging methods to evaluate cofactor, transpose and adjoint of a 2x2 matrix
{

	cofact_cal(m : Matrix ) : Matrix{
		(let a1 :Int <- m.get_e1(),a2:Int <-m.get_e2(),a3:Int<-m.get_e3(),a4:Int<-m.get_e4() in
			(let b:Matrix <- new Matrix in
				{
					b.setval(a4,~a3,~a2,a1);
					b;
				}
			)	
		)
	};



	transpose_cal(m : Matrix) : Matrix
	{
		(let a1:Int<-m.get_e1(),a2:Int<-m.get_e2(),a3:Int<-m.get_e3(),a4:Int<-m.get_e4() in

			(let b : Matrix <- new Matrix in
				{
					b.setval(a1,a3,a2,a4);
					b;
				}
			)
		)
	};

	adj_cal(m : Matrix) : Matrix
	{
		(let b : Matrix in
		{
			b<-transpose_cal(cofact_cal(m));
			b;		
		}
		)
	};

};

class Main inherits Cal{

	m : Matrix <- new Matrix;         -- m is the object of matrix class
	cofact : Matrix ;
	transpose:Matrix;
	adj:Matrix;
	main():Object{
		{
			out_string("Enter the input\n");
			m.input();                               -- taking the user input and performing ops on it
			out_string("Given Matrix is:\n");
			m.print();
			transpose <- transpose_cal(m);
			out_string("Transpose is:\n");
			transpose.print();
			cofact <- cofact_cal(m);
			out_string("Cofact is:\n");
			cofact.print();
			adj <- adj_cal(m);
			out_string("Adjoint  is:\n");
			adj.print();
			out_string("The det is ");
			out_int(m.determinant());
			out_string("\n");
		}
	};
};
