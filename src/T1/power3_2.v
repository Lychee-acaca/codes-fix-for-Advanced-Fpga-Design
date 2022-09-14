module power3_2(
output	reg	[7:0]	XPower,
input				clk,
input		[7:0]	X
);

reg	[7:0]	XPower1, XPower2;
reg	[7:0]	X1, X2;

always @(posedge clk) begin
	X1 <= X;
	XPower1 <= X;
	
	X2 <= X1;
	XPower2 <= XPower1 * X1;
	
	XPower <= XPower2 * X2;

end

endmodule
