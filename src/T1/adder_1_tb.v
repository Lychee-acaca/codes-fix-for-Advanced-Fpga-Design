`timescale 10ps/10ps

module adder_1_tb;

reg		[7:0]	A, B, C;
reg				clk;
wire	[7:0]	Sum;

initial
begin
	clk <= 0;
	A <= 8'd123;
	B <= 8'd32;
	C <= 8'd19;
	
	#20;
	A <= 8'd13;
	B <= 8'd42;
	C <= 8'd79;
	
	#20;
	A <= 8'd7;
	B <= 8'd6;
	C <= 8'd4;
end

always #10 clk <= ~clk;

adder_1 adder_1_tb(
	.A(A),
	.B(B),
	.C(C),
	.clk(clk),
	.Sum(Sum)
);

endmodule
