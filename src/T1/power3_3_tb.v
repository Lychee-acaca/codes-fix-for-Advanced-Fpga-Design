`timescale 10ps/10ps

module power3_3_tb;

reg		[7:0]	X;
wire	[7:0]	XPower;

initial
begin
	X <= 8'D1;
	#20 X <= X + 1'b1;
	#20 X <= X + 1'b1;
	#20 X <= X + 1'b1;
	#20 X <= X + 1'b1;
	#20 X <= X + 1'b1;
	#20 X <= X + 1'b1;
end

power3_3 power3_3_tb(
	.X(X),
	.XPower(XPower)
);

endmodule
