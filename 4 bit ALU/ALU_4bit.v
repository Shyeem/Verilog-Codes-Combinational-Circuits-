module ALU_4bit(a,b,op,y);

input [3:0]a,b;
input [1:0]op;
output reg [7:0]y;

always@(a,b,op)

	case(op)
	0:y=a+b;
	1:y=a-b;
	2:y=a*b;
	3:y=a&b;
	endcase

endmodule


module ALU_4bit_tb;

reg [3:0]a,b;
reg [1:0]op;
wire [7:0]y;

ALU_4bit dut(.*);

initial begin 
a=15;b=14;

#5  op=0;
#10 op=1;
#10 op=2;
#10 op=3;
#20 $finish();

end
endmodule


