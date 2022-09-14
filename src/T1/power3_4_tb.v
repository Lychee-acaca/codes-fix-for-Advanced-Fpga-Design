`timescale 10ps/10ps

module power3_4_tb;

reg		[7:0]	X;
reg				clk;
wire	[7:0]	XPower;

initial
begin
	clk <= 0;
	X <= 8'D3;
	#20 X <= X + 1'b1;
	#20 X <= X + 1'b1;
	#20 X <= X + 1'b1;
	#20 X <= X + 1'b1;
end

always #10 clk <= ~clk;

power3_4 power3_4_tb(
	.X(X),
	.clk(clk),
	.XPower(XPower)
);

endmodule
