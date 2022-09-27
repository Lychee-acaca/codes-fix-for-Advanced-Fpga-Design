module randomlogic_2(
output	reg	[7:0]	Out,
input		[7:0]	A, B, C,
input				clk,
input				Cond1, Cond2
);

wire	CondB = (Cond2 & !Cond1);

always @(posedge clk)
	if (CondB && (C < 8))
		Out <= B;
	else if (Cond1)
		Out <= A;
	else
		Out <= C;
endmodule
