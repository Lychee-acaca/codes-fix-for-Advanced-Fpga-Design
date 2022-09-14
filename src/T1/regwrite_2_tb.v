`timescale 10ps/10ps

module regwrite_2_tb;

reg				clk, in;
reg		[3:0]	ctrl;
wire	[3:0]	rout;

initial
begin
	clk <= 0;
	#20 ctrl <= 4'b0001;
	in <= 1'b1;
	
	#20 ctrl <= 4'b0001;
	in <= 1'b1;

	#20 ctrl <= 4'b0100;
	in <= 1'b1;

	#20 ctrl <= 4'b0010;
	in <= 1'b0;

	#20 ctrl <= 4'b1000;
	in <= 1'b1;
end

always #10 clk <= ~clk;

regwrite_2 regwrite_2_tb(
	.ctrl(ctrl),
	.in(in),
	.clk(clk),
	.rout(rout)
);

endmodule
