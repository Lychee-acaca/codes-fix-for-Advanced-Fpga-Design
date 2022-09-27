`timescale 10ps/10ps

module mult8_2_tb;

wire	[7:0]	product;
wire			done;
reg		[7:0]	A, B;
reg				clk;
reg				start;

initial
begin
	start <= 1;
	clk <= 0;	
	A = 8'D21;
	B = 8'D18;
	#15;
	start <= 0;
	
	#100;
	start <= 1;
	A = 8'D12;
	B = 8'D11;
	#20;
	start <= 0;
	
	#100;
	start <= 1;
	A = 8'D28;
	B = 8'D56;
	#20;
	start <= 0;
end

always #10 clk <= ~clk;

mult8_2 mult8_2_tb(
	.product(product),
	.A(A),
	.B(B),
	.clk(clk),
	.start(start),
	.done(done)
);

endmodule
