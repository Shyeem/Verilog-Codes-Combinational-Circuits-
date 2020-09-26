//the input and output can be defined
//there is an enable pin
//here a 3 to 8 decoder is implemented
module decoder_using_for(x,en,y);
input [2:0]x;//change a/c to i/p (ip-1)
input en;
output reg[7:0]y;//change a/c to o/p (op-1)
integer k;
always@(x,en)
if(en==1)
	begin //change k a/c to o/p (op-1)
	for (k=0;k<=7;k=k+1)
		if (x==k)
			y[k]=1;
		else
			y[k]=0;
	end
	
else
	y=0;
endmodule

`timescale 1ns/1ps
module decoder_using_for_tb;
reg [2:0]x;//change a/c to i/p (ip-1)
reg en;
wire [7:0]y;//change a/c to o/p (op-1)

decoder_using_for dut(.*);
	initial begin
	en=0;
	#10 x=3'b001;//op=10000000
	#10 en=1;
	#10 x=3'b010;//op=00100000
	#10 x=3'b111;//op=00000001

	#40 $finish();
	end
endmodule
