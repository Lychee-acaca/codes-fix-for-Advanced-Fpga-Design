module adder_2(
output	reg	[7:0]	Sum,
input		[7:0]	A, B, C,
input				clk
);

reg			[7:0]	rABSum, rC;

always @(posedge clk) begin
	rABSum	<=	A + B;
	rC		<=	C;
	Sum		<=	rABSum + rC;
end
endmodule
