module regwrite_1(
output	reg	[3:0]	rout,
input				clk, in,
input		[3:0]	ctrl
);

always @(posedge clk)
	if (ctrl[0])		rout[0] <= in;
	else if (ctrl[1])	rout[1] <= in;
	else if (ctrl[2])	rout[2] <= in;
	else if (ctrl[3])	rout[3] <= in;

endmodule
