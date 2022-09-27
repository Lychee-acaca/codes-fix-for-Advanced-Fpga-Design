`timescale 10ps/10ps

module mult8_1_tb;

wire	[7:0]	product;
reg		[7:0]	A, B;
reg				clk;

initial
begin
	clk <= 0;
	A = 8'D21;
	B = 8'D18;
	
	#20;
	A = 8'D12;
	B = 8'D11;
	
	#20;
	A = 8'D28;
	B = 8'D56;
end

always #10 clk <= ~clk;

mult8_1 mult8_1_tb(
	.product(product),
	.A(A),
	.B(B),
	.clk(clk)
);

endmodule
