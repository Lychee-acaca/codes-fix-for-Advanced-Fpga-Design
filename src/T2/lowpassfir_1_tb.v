`timescale 10ps/10ps

module lowpassfir_1_tb;

wire	[7:0]	filtout;
wire			done;

reg				clk;
reg		[7:0]	datain;
reg				datavalid;
reg		[7:0]	coeffA, coeffB, coeffC;

initial
begin
	clk <= 0;
	
	coeffA <= 13;
	coeffB <= 14;
	coeffC <= 16;
	
	datavalid <= 1;
	datain <= 1;
end

always #10 clk <= ~clk;

always @(done)
	if (done)
		datain = datain + 1;

lowpassfir_1 lowpassfir_1_tb(
	.filtout(filtout),
	.done(done),
	.clk(clk),
	.datain(datain),
	.datavalid(datavalid),
	.coeffA(coeffA),
	.coeffB(coeffB),
	.coeffC(coeffC)
);

endmodule
