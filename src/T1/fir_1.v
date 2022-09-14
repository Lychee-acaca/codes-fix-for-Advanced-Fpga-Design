module fir_1(
output	reg	[7:0]	Y,
input		[7:0]	A, B, C, X,
input				clk,
input				validsample
);

reg	[7:0]	X1, X2;
always @(posedge clk)
	if (validsample) begin
		X1 <= X;
		X2 <= X1;
		Y <= A * X + B * X1 + C * X2;
	end
endmodule
