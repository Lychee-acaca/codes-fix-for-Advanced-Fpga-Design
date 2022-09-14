`timescale 10ps/10ps

module fir_1_tb;

reg		[7:0]	X, A, B, C;
reg				v, clk;
wire	[7:0]	Y;

initial
begin
	clk <= 0;
	A <= 8'D3;
	B <= 8'D1;
	C <= 8'D2;
	X <= 8'D2;
	v <= 1;
	
	#20 X <= 8'D1;
	#20 X <= 8'D2;
	#20 X <= 8'D3;
	#20 X <= 8'D4;
	#20 X <= 8'D5;
end

always #10 clk <= ~clk;

fir_1 fir_1_tb(
	.Y(Y),
	.A(A), .B(B), .C(C),
	.X(X),
	.clk(clk),
	.validsample(v)
);

endmodule
