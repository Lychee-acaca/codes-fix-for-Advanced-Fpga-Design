`timescale 10ps/10ps

module I2S_1_tb;

reg				iBCK;
reg				iSysClk;
reg				iDataIn;
reg				iLRCK;
wire			oStrobeL, oStrobeR;
wire	[23:0]	oDataL, oDataR;

initial
begin
	iSysClk <= 0;
	iBCK <= 0;
	
	iDataIn <= 0;
	iLRCK <= 1;
	
	//左通道，1010_0111_0010_1101
	#20 iLRCK <= 0;
	
	#20 iDataIn <= 1;
	#20 iDataIn <= 0;
	#20 iDataIn <= 1;
	#20 iDataIn <= 0;
	
	#20 iDataIn <= 0;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	#20 iDataIn <= 1;
	#20 iDataIn <= 0;
	
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 0;
	#20 iDataIn <= 1;
	
	
	//右通道，0010_1111_0110_1101
	#40 iLRCK <= 1;
	
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	#20 iDataIn <= 1;
	#20 iDataIn <= 0;
	
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	
	#20 iDataIn <= 0;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 0;
	
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 0;
	#20 iDataIn <= 1;
	
	//左通道，1111_1111_1111_1110
	#40 iLRCK <= 0;
	
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 1;
	#20 iDataIn <= 0;
	
	//右通道，0000_0000_0000_0001
	#40 iLRCK <= 1;
	
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	#20 iDataIn <= 0;
	#20 iDataIn <= 1;
	
	
	#40 iLRCK <= 0;
end

always #2	iSysClk <= ~iSysClk;
always #10	iBCK <= ~iBCK;

I2S_1 I2S_1_tb(
	.iBCK(iBCK),
	.iSysClk(iSysClk),
	.iDataIn(iDataIn),
	.iLRCK(iLRCK),
	.oStrobeL(oStrobeL),
	.oStrobeR(oStrobeR),
	.oDataL(oDataL),
	.oDataR(oDataR)
);

endmodule
