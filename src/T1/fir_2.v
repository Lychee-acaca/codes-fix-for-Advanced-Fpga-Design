module fir_2(
output	reg	[7:0]	Y,
input		[7:0]	A, B, C, X,
input				clk,
input				validsample
);

reg	[7:0]	X1, X2;
reg [7:0]	prod1, prod2, prod3;

always @(posedge clk) begin
	if (validsample) begin
		X1 <= X;
		X2 <= X1;
		prod1 <= A * X;
		prod2 <= B * X1;
		prod3 <= C * X2;
	end
	Y <= prod1 + prod2 + prod3;
end

endmodule
