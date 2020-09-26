module halfadder(x,y,S,C);
input x,y;
output S,C;
	xor(S,x,y);
	assign C=x*y;
endmodule

module fulladderw2ha(x,y,z,S,C);
input x,y,z;
output S,C;
wire A,B,D;
	halfadder HA1(x,y,A,B);
	halfadder HA2(z,A,S,D);
	or(C,B,D);
endmodule

`timescale 1ns/1ps
module fulladderw2ha_tb;

reg x,y,z;
wire S,C;

fulladderw2ha dut(.*); 

	initial begin 
	x=0;y=0;z=0;
	forever #5 x=~x; end
	initial begin forever #10 y=~y;end
	initial begin forever #20 z=~z;end
	initial begin #100 $finish(); end
endmodule
