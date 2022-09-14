module power3_4(
output	[7:0]	XPower,
input	[7:0]	X,
input			clk
);

reg		[7:0]	XPower1;
reg		[7:0]	XPower2_ppAA, XPower2_ppAB, XPower2_ppBB;
reg		[7:0]	XPower3_ppAA, XPower3_ppAB, XPower3_ppBA, XPower3_ppBB;
reg		[7:0]	X1, X2;
wire	[7:0]	XPower2;

wire	[3:0]	XPower1_A	= XPower1[7:4];
wire	[3:0]	XPower1_B	= XPower1[3:0];
wire	[3:0]	X1_A		= X1[7:4];
wire	[3:0]	X1_B		= X1[3:0];
wire	[3:0]	XPower2_A	= XPower2[7:4];
wire	[3:0]	XPower2_B	= XPower2[3:0];
wire	[3:0]	X2_A		= X2[7:4];
wire	[3:0]	X2_B		= X2[3:0];

assign XPower2				= (XPower2_ppAA << 8) +
							  (2 * (XPower2_ppAB << 4)) +
							  XPower2_ppBB;
				 
assign XPower				= (XPower3_ppAA << 8) +
							  ((XPower3_ppAB << 4) + (XPower3_ppBA << 4)) +
							  XPower3_ppBB;

always @(posedge clk) begin
	X1				<= X;
	XPower1			<= X;
	
	X2				<= X1;
	
	XPower2_ppAA	<= XPower1_A * X1_A;
	XPower2_ppAB	<= XPower1_A * X1_B;
	XPower2_ppBB	<= XPower1_B * X1_B;
	
	XPower3_ppAA	<= XPower2_A * X2_A;
	XPower3_ppAB	<= XPower2_A * X2_B;
	XPower3_ppBA	<= XPower2_B * X2_A;
	XPower3_ppBB	<= XPower2_B * X2_B;
end

endmodule
