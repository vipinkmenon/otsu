module otsuCalc(
input	    			i_clk,
input	   				i_reset_n,
input [31:0] 			i_in_data,
input [7:0] 			i_threshold,
input       			i_in_data_valid,
output [31:0] 			o_bw_data,
output [256*32-1:0]     o_histogram
);


generate
genvar i;
for(i=0;i<256;i=i+1)
begin : histLoop
	histCalculator #(.dataWidth(32),.greyLevel(i))hC(
	.i_clk(i_clk),
	.i_reset_n(i_reset_n),
	.i_data(i_in_data),
	.i_data_valid(i_in_data_valid),
	.o_histogram(o_histogram[i*32+:32])
);
end
endgenerate


thresholder #(.dataWidth(32)) thresholder(
	.i_clk(i_clk),
	.i_data(i_in_data),
	.o_data(o_bw_data),
	.i_threshold(i_threshold)
);

endmodule