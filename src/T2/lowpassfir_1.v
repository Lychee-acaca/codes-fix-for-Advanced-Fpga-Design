module lowpassfir_1(
output	reg	[7:0]	filtout,
output	reg			done,
input				clk,
input		[7:0]	datain,
input				datavalid,
input		[7:0]	coeffA, coeffB, coeffC
);

reg			[7:0]	X0, X1, X2;
reg					multdonedelay;
reg					multdone_1;
reg					multdone_trig;
reg					multstart;

reg			[7:0]	multdat;
reg			[7:0]	multcoeff;

reg			[2:0]	state;

reg			[7:0]	accum;
reg					clearaccum;
reg			[7:0]	accumsum;

wire				multdone;
wire		[7:0]	multout;

mult8_2 mult8_2(
	.clk(clk),
	.A(multdat),
	.B(multcoeff),
	.start(multstart),
	.done(multdone),
	.product(multout)
);

always @(posedge clk)
	if (multdone) begin
		if (!multdone_trig) begin
			multdone_trig <= 1;
			multdone_1 <= 1;
		end else 
			multdone_1 <= 0;
	end
	else begin
		multdone_trig <= 0;
		multdone_1 <= 0;
	end

always @(posedge clk) begin
	multdonedelay <= multdone;
	accumsum <= accum + multout[7:0];
	
	if (clearaccum)
		accum <= 0;
	else if (multdone_1)
		accum <= accumsum;
		
	case(state)
		0: begin
			if (datavalid) begin
				X0 <= datain;
				X1 <= X0;
				X2 <= X1;
				multdat <= datain;
				multcoeff <= coeffA;
				multstart <= 1;
				clearaccum <= 1;
				state <= 1;
			end
			else begin
				multstart <= 0;
				clearaccum <= 0;
				done <= 0;
			end
		end
		1: begin
			if (multdone_1) begin	
				multdat <= X1;
				multcoeff <= coeffB;
				multstart <= 1;
				state <= 2;
			end
			else begin 
				multstart <= 0;
				clearaccum <= 0;
				done <= 0;
			end
		end
		2: begin
			if (multdone_1) begin
				multdat <= X2;
				multcoeff <= coeffC;
				multstart <= 1;
				state <= 3;
			end
			else begin
				multstart <= 0;
				clearaccum <= 0;
				done <= 0;
			end
		end
		3: begin
			if (multdone_1) begin
				filtout <= accumsum;
				done <= 1;
				state <= 0;
			end
			else begin
				multstart <= 0;
				clearaccum <= 0;
				done <= 0;
			end
		end
		default
			state <= 0;
	endcase
end
endmodule
