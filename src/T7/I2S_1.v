//只能输入16位，但是要强行整成24位的结果输出
//只能说，编者你开心就好
module I2S_1(
output	reg			oStrobeL, oStrobeR,
output	reg	[23:0]	oDataL, oDataR,
input				iBCK,
input				iSysClk,
input				iDataIn,
input				iLRCK
);

reg				DataCapture;
reg				rdatain;
reg		[23:0]	Capture;
reg				StrobeL, StrobeR;
reg		[2:0]	StrobeDelayL, StrobeDelayR;
reg		[23:0]	DataL, DataR;
reg				LRCKPrev;
reg		[4:0]	bitcounter;
reg				triggerleft, triggerright;

wire			LRCKRise, LRCKFall;
wire	[23:0]	DataMux;

assign LRCKRise = iLRCK & !LRCKPrev; //iLRCK上升沿捕获
assign LRCKFall = !iLRCK & LRCKPrev; //iLRCK下降沿捕获

assign DataMux = {Capture[15:0], 8'b0};

always @(posedge iBCK) begin
	DataCapture <= (bitcounter != 0); //数据捕获标记，如果计数器在工作就置1
	triggerleft <= LRCKRise; //延时一个周期的左声道数据输入结束标记
	triggerright <= LRCKFall; //延时一个周期的右声道数据输入结束标记
	rdatain <= iDataIn;
	LRCKPrev <= iLRCK; //iLRCK的上一个状态
	
	//左移数据输入
	if (DataCapture)
		Capture[23:0] <= {Capture[22:0], rdatain};
	
	//计数器置位和计数
	if (LRCKRise || LRCKFall)
		bitcounter <= 16;
	else if (bitcounter != 0)
		bitcounter <= bitcounter - 1;
	
	//输入结束
	if (triggerleft) begin
		DataL[23:0] <= DataMux;
		StrobeL <= 1;
	end
	else if (triggerright) begin
		DataR[23:0] <= DataMux;
		StrobeR <= 1;
	end
	else begin
		StrobeL <= 0;
		StrobeR <= 0;
	end
end

always @(posedge iSysClk) begin
	StrobeDelayL <= {StrobeDelayL[1:0], StrobeL};
	StrobeDelayR <= {StrobeDelayR[1:0], StrobeR};
	
	if (StrobeDelayL[1] & !StrobeDelayL[2]) begin
		oDataL <= DataL;
		oStrobeL <= 1;
	end
	else
		oStrobeL <= 0;
	if (StrobeDelayR[1] & !StrobeDelayR[2]) begin
		oDataR <= DataR;
		oStrobeR <= 1;
	end
	else
		oStrobeR <= 0;
end

endmodule
