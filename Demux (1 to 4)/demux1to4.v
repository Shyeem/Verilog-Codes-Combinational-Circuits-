//demux is a device that takes a single input line and routes it to one of several digital output lines

module demux1to4(y,s,a,b,c,d);

input [4:0]y;
input [1:0]s;
output reg [4:0]a,b,c,d;
//only the selected pin gets output,rest are 0
always@(y,s)
	begin
		if (s==2'b00) 
		   a=y;
		else if (s==2'b01)
		   b=y;
		else if (s==2'b10) 
		   c=y;
		else if (s==2'b11)
		   d=y;
	end
endmodule

`timescale 1ns/1ps
module demux1to4_tb;
reg [4:0]y;
reg [1:0]s;
wire [4:0]a,b,c,d;

demux1to4 dut(.*);
	initial begin 
	y=0;
	#10 s=2'h0; 
	#10 y=4'h4; 
	#10 s=2'h0;	y=4'h5;   
	#10 s=2'h1;	y=4'h6; 
	#10 s=2'h2;	y=4'h7;   
	#10 s=2'h3;    

	 end
initial begin
#80 $finish();
end
endmodule
