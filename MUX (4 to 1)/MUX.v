//4 to 1 mux
//selection pin is 2bit number
//the inputs are 4bits
//so the selected i/p is shown in o/p
module mux4to1(a,b,c,d,s,y);
input [4:0]a,b,c,d;
input [1:0]s;
output reg [4:0]y;

always@(a,b,c,d,s)
	begin
		case(s)
		2'b00:y=a;
		2'b01:y=b;
		2'b10:y=c;
		2'b11:y=d;
		endcase
	end
endmodule


`timescale 1ns/1ps
module mux4to1_tb;
reg [1:0]s;
reg [4:0]a,b,c,d;
wire [4:0]y;

mux4to1 dut(.*);
	initial begin 
	a=0;b=0;c=0;d=0;s=0;

	#10 a=4'h4;b=4'h5;c=4'h6;d=4'h7; 
	#10 s=2'h0;   
	#10 s=2'h1;
	#10 s=2'h2;  
	#10 s=2'h3;    

	 end
initial begin
#80 $finish();
end
endmodule
