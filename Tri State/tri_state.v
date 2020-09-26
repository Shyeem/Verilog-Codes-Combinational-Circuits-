/*The third state is a high-impedance state in which 
(1) the logic behaves like an open circuit, which means that the output appears to be disconnected, 
(2) the circuit has no logic significance, and 
(3) the circuit connected to the output of the three-stategate is not affected by the inputs to the gate.
Three-state gates may perform any conventional logic, such as AND or NAND. 
However, the one most commonly used is the buffer gate*/

//control=1 gives a,0 gives 0,otherwise Z

module tri_state (a, control, tri_out);

   input a, control;
   output tri_out;
   reg tri_out;
   always @(control or a)
	if (control)
	   tri_out = a;		   
	else if (!control)
	   tri_out = 0;
	else
	   tri_out = 1'bZ;
endmodule

`timescale 1ns/1ps
module tri_state_tb;
reg a, control;
wire tri_out;

tri_state dut(.*);
	initial begin 
	a=0;control=0;

	#10 a=1; 
	#10 control=1;   
	#10 control=1'bX;  

	 end
initial begin
#50 $finish();
end
endmodule
