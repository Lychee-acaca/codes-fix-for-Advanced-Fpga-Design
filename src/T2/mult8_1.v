module mult8_1(
output	[7:0]	product,
input	[7:0]	A, B,
input			clk
);

reg [15:0] prod16;

assign product = prod16[7:0];

always @(posedge clk)
	prod16 <= A * B;
	
endmodule
