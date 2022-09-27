module adder_1(
output	reg	[7:0]	Sum,
input		[7:0]	A, B, C,
input				clk
);

reg	[7:0]	rA, rB, rC;

always @(posedge clk) begin
	rA	<=	A;
	rB	<=	B;
	rC	<=	C;
	Sum	<=	rA + rB + rC;
end
endmodule
