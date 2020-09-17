Class Tic_tac_toe inherits IO{  -- Game class wherein logic of winning of a player  are present 

	win(m:Matrix ):Object{ 
		(let a1 :Int <- m.get_e1(),a2:Int <-m.get_e2(),a3:Int<-m.get_e3(),a4:Int<-m.get_e4(),a5:Int<-m.get_e5(),a6:Int<-m.get_e6(),a7:Int<-m.get_e4(),a8:Int<-m.get_e8(),a9:Int<-m.get_e9() in
			if(or(and(a1=1,a2=1,a3=1),and(a1=1,a4=1,a7=1),and(a1=1,a5=1,a9=1),and(a4=1,a5=1,a6=1),and(a7=1,a8=1,a9=1),and(a2=1,a5=1,a8=1),and(a3=1,a6=1,a9=1),and(a3=1,a5=1,a7=1)))
			then {
				out_string("\nPlayer 1 WINS!!\n");
				abort();
			}
			else if(or(and(a1=2,a2=2,a3=2),and(a1=2,a4=2,a7=2),and(a1=2,a5=2,a9=2),and(a4=2,a5=2,a6=2),and(a7=2,a8=2,a9=2),and(a2=2,a5=2,a8=2),and(a3=2,a6=2,a9=2),and(a3=2,a5=2,a7=2)))
			then{
				
				out_string("\nPlayer 2 WINS!!\n");
				abort();
			}
			else out_string("\nContinue Playing!\n")
			fi fi
			)
	};

	and(i:Bool,j:Bool,k:Bool):Bool{   -- logical and for 3 variables
		if(i=false)
		then false
		else if(j=false)
		then false
		else if(k=false)
		then false
		else true
		fi fi fi
	};

	and1(i:Bool,j:Bool):Bool{      -- logical and for 2 variables , function overloading not present 
		if(i=false)					-- hence have used diff function
		then false
		else if(j=false)
		then false
		else true
		fi fi
	};

	or(i1:Bool,i2:Bool,i3:Bool,i4:Bool,i5:Bool,i6:Bool,i7:Bool,i8:Bool):Bool{  -- logical or for 8 variables
		if(i1=true)
		then true
		else if(i2=true)
		then true
		else if(i3=true)
		then true
		else if(i4=true)
		then true
		else if(i5=true)
		then true
		else if(i6=true)
		then true
		else if(i7=true)
		then true
		else if(i8=true)
		then true
		else false
		fi fi fi fi fi fi fi fi
	};

};

class Matrix inherits Tic_tac_toe{     -- Board for the tic tac toe , it inherits methods of tic tac toe class

	e1 : Int<-0;  -- initializing the board with 0s
	e2 : Int<-0;
	e3 : Int<-0;
	e4 : Int<-0;
	e5 : Int<-0;
	e6 : Int<-0;
	e7 : Int<-0;
	e8 : Int<-0;
	e9 : Int<-0;

	input(i:Int,p:Int):Int{          -- input for the board 
		if(and1(e1=0,i=1)) 
		then {
			e1 <- p;
			0;
		}
		else if(and1(e2=0,i=2))
		then {
			e2 <- p;
			0;
		}
		else if(and1(e3=0,i=3))
		then {
			e3 <- p;
			0;
		}
		else if(and1(e4=0,i=4))
		then {
			e4 <- p;
			0;
		}
		else if(and1(e5=0,i=5))
		then {
			e5 <- p;
			0;
		}
		else if(and1(e6=0,i=6))
		then {
			e6 <- p;
			0;
		}
		else if(and1(e7=0,i=7))
		then {
			e7 <- p;
			0;
		}
		else if(and1(e8=0,i=8))
		then {
			e8 <- p;
			0;
		}
		else if(and1(e9=0,i=9))
		then {
			e9 <- p;
			0;
		}
		else {
			out_string("\nAlready Marked! or out of range\n");
			1;
		}
		fi fi fi fi fi fi fi fi	fi
	};


	get_e1():Int {e1};     -- varibales not accessible in other classes therefore creating a functio to access them
	get_e2():Int {e2};
	get_e3():Int {e3};
	get_e4():Int {e4};
	get_e5():Int {e5};
	get_e6():Int {e6};
	get_e7():Int {e7};
	get_e8():Int {e8};
	get_e9():Int {e9};


	print():Object{           -- printing the board
		{
			out_int(e1);
			out_string("  ");
			out_int(e2);
			out_string("  ");
			out_int(e3);
			out_string("\n");
			out_int(e4);
			out_string("  ");
			out_int(e5);
			out_string("  ");
			out_int(e6);
			out_string("\n");
			out_int(e7);
			out_string("  ");
			out_int(e8);
			out_string("  ");
			out_int(e9);
			out_string("\n");
		}
	};
};

Class Main inherits IO{          -- main function 

	b : Matrix <- new Matrix;   -- b is the board 
	i:Int<-0;                     -- counter of number of turns played until now
	pos:Int;
	main():Object{
		{
			out_string("\nTic-Tac-Toe\n");
			while(i<=9)
			loop
			{
				out_string("\nSample positions \n");
				out_string("1  2  3\n4  5  6\n7  8  9\n\nCurrent Board\n\n");
				b.print();
				out_string("\nPlayer 1\nEnter the position:");
				pos<-in_int();
				while(b.input(pos,1)=1)
				loop
				{
					out_string("\nPlayer 1\n");
					out_string("\nSample positions \n");
					out_string("1  2  3\n4  5  6\n7  8  9\n\nCurrent Board\n\n");
					b.print();
					out_string("\nEnter the position again : ");
					pos<-in_int();
				}
				pool;
				i<-i+1;
				b.print();
				b.win(b);
				if(i=9)
				then {
					out_string("\nIts a Tie!!\n");
					abort();
				}
				else out_string("\n")
				fi;
				out_string("\nSample positions \n");
				out_string("1  2  3\n4  5  6\n7  8  9\n\nCurrent Board\n\n");
				b.print();
				out_string("\nPlayer 2\nEnter the position:");
				pos<-in_int();
				while(b.input(pos,2)=1)
				loop
				{
					out_string("\nPlayer 2\n");
					out_string("\nSample positions \n");
					out_string("1  2  3\n4  5  6\n7  8  9\n\nCurrent Board\n\n");
					b.print();
					out_string("\nEnter the position again : ");
					pos<-in_int();
				}
				pool;
				i<-i+1;
				b.print();
				b.win(b);
			}
			pool;
		}

	};

};