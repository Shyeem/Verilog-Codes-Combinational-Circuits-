module full_adder(x,y,z,S,C);
input x,y,z;
output S,C;
wire A;

	xor(S,x,y,z);
	assign C=x*y+x*z+y*z;

endmodule

module full_adder_tb;

reg x,y,z;
wire S,C;

full_adder dut(.*); 

	initial begin 
	x=0;y=0;z=0;

	forever #5 x=~x; 
	end

	initial begin
	forever #10 y=~y;
	end

	initial begin
	forever #20 z=~z;
	end

	initial begin
	#100 $finish();
end
endmodule
