//table: Morris Mano pg 155
module encoder(A, X);
   input [7:0]X;
   output [2:0]A;  

   or(A[0], X[1], X[3], X[5], X[7]);
   or(A[1], X[2], X[3], X[6], X[7]);
   or(A[2], X[4], X[5], X[6], X[7]);

endmodule 



`timescale 1ns/1ps
module encoder_tb;
reg [7:0]X;
wire [2:0]A; 
//the input will be pulse of 1
encoder dut(.*);
	initial begin 
	X=0;
	#10 X[0]=1; 
	#10 X[0]=0; X[1]=1; 
	#10 X[1]=0;X[2]=1; 
	#10 X[2]=0;X[3]=1; 
	#10 X[3]=0;X[4]=1;
	#10 X[4]=0;X[5]=1; 
	#10 X[5]=0;X[6]=1; 
	#10 X[6]=0;X[7]=1; 
	end
	initial begin
	#100 $finish();
	end
endmodule
