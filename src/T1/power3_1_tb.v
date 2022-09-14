`timescale 10ps/10ps

module power3_1_tb;

reg		[7:0]	X;
reg				clk, start;
wire	[7:0]	XPower;
wire			finished;

initial
begin
	clk <= 0;
	start <= 1;
	X <= 8'D3;
	
	#40 start <= 0;
end

always #10 clk <= ~clk;

power3_1 power3_1_tb(
	.X(X),
	.clk(clk),
	.start(start),
	.XPower(XPower),
	.finished(finished)
);

endmodule
