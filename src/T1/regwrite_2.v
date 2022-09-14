module regwrite_2(
output	reg	[3:0]	rout,
input				clk, in,
input		[3:0]	ctrl
);

always @(posedge clk) begin
	if (ctrl[0])	rout[0] <= in;
	if (ctrl[1])	rout[1] <= in;
	if (ctrl[2])	rout[2] <= in;
	if (ctrl[3])	rout[3] <= in;
end

endmodule
