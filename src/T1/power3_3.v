module power3_3(
output	[7:0]	XPower,
input	[7:0]	X
);

reg	[7:0]	XPower1, XPower2;
reg	[7:0]	X1, X2;

assign XPower = XPower2 * X2;

always @* begin
	X1 = X;
	XPower1 = X;
end

always @* begin
	X2 = X1;
	XPower2 = XPower1 * X1;
end
endmodule
