`timescale 10ps/10ps

module power3_2_tb;

reg		[7:0]	X;
reg				clk;
wire	[7:0]	XPower;

initial
begin
	clk <= 0;
	X <= 8'D3;
	
	#20 X <= 8'D4;
	#20 X <= 8'D5;
end

always #10 clk <= ~clk;

power3_2 power3_2_tb(
	.X(X),
	.clk(clk),
	.XPower(XPower)
);

endmodule
