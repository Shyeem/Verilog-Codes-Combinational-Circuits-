//shows whether one digit is greater, equal, less than other

module fourbit_comparator(A,B,A_grt_B,A_lt_B,A_eq_B);
input [3:0] A,B;
output A_grt_B,A_lt_B,A_eq_B;

assign A_grt_B=(A>B);
assign A_lt_B=(A<B);
assign A_eq_B=(A==B);

endmodule

`timescale 1ns/1ps
module fourbit_comparator_tb;

reg [3:0] A,B;
wire A_grt_B,A_lt_B,A_eq_B;

fourbit_comparator dut(.*);
	initial begin 
	A=0;B=0;
   	#10 A=4'h5; B=4'h4;
	#10 A=4'h2; B=4'h6;
	#10 A=4'h2; B=4'h2;
end
initial begin
#40 $finish();
end
endmodule
