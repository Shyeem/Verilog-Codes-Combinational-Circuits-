module FA(x,y,z,S,C);
input x,y,z;
output S,C;
wire A;
	xor(S,x,y,z);
	assign C=x*y+x*z+y*z;
endmodule

module adder_subt_4b(x,y,op,S,C,V);
input [3:0]x,y;
input op; //operation
output V; //overflow
output [3:0] S,C;
wire y0,y1,y2,y3;
//xor with op makes it +ve & -ve
	xor(y0,y[0],op);
	xor(y1,y[1],op);
	xor(y2,y[2],op);
	xor(y3,y[3],op);

FA FA0 (x[0],y0,op,S[0],C[0]);
FA FA1 (x[1],y1,C[0],S[1],C[1]);
FA FA2 (x[2],y2,C[1],S[2],C[2]);
FA FA3 (x[3],y3,C[2],S[3],C[3]);

xor(V,C[3],C[2]);//overflow
endmodule

`timescale 1ns/1ps
module adder_subt_4b_tb;
reg [3:0]x,y;
reg op;
wire [3:0] S,C;
wire V;

adder_subt_4b dut(.*);

initial begin
   x=4'h5;
   y=4'h4;
#10 op=0;
#10 op=1;
#10 x=4'h6; y=4'h2;op=0;
#10 op=1;

	#40 $finish();

  end
endmodule

