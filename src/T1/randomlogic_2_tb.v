`timescale 10ps/10ps

module randomlogic_2_tb;

wire	[7:0]	Out;
reg		[7:0]	A, B, C;
reg				clk;
reg				Cond1, Cond2;

initial
begin
	clk <= 0;
	A <= 8'd123;
	B <= 8'd32;
	C <= 8'd19;
	Cond1 <= 0;
	Cond2 <= 0;
	
	#20;
	A <= 8'd13;
	B <= 8'd42;
	C <= 8'd79;
	Cond1 <= 1;
	Cond2 <= 0;
	
	#20;
	A <= 8'd7;
	B <= 8'd6;
	C <= 8'd4;
	Cond1 <= 0;
	Cond2 <= 1;
end

always #10 clk <= ~clk;

randomlogic_2 randomlogic_2_tb(
	.A(A),
	.B(B),
	.C(C),
	.Cond1(Cond1),
	.Cond2(Cond2),
	.clk(clk),
	.Out(Out)
);

endmodule
