module halfadder(x,y,S,C);
input x,y;
output S,C;

	xor(S,x,y);
	assign C=x*y;

endmodule


`timescale 1ns/1ps

module halfadder_tb;

reg x,y;
wire S,C;

halfadder dut(.*); 

	initial begin 
	x=0;y=0;

	forever #5 x=~x; 
	end

	initial begin
	forever #10 y=~y;
	end

	initial begin
	#100 $finish();
end
endmodule
