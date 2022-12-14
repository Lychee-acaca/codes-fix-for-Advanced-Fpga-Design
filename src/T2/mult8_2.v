module mult8_2(
output				done,
output	reg	[7:0]	product,
input		[7:0]	A, B,
input				clk, start
);

reg	[4:0]	multcounter;
reg	[7:0]	shiftA, shiftB;

wire adden;

assign adden = shiftA[0] & !done;
assign done = multcounter[3];

always @(posedge clk) begin
	if (start)
		multcounter <= 0;
	else if (!done)
		multcounter <= multcounter + 1;
	
	if (start)
		shiftB <= B;
	else
		shiftB[7:0] <= {shiftB[6:0], 1'b0};
	
	if (start)
		shiftA <= A;
	else
		shiftA[7:0] <= {1'b0, shiftA[7:1]};
	
	if (start)
		product <= 0;
	else if (adden)
		product <= product + shiftB;
end
endmodule
