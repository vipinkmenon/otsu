module histCalculator #(parameter dataWidth=32,greyLevel=0)(
input					i_clk,
input					i_reset_n,
input [dataWidth-1:0]	i_data,
input					i_data_valid,
output	reg [31:0] 		o_histogram
);

wire [3:0] compOut;

assign compOut[0] = (i_data[7:0] == greyLevel);
assign compOut[1] = (i_data[15:8] == greyLevel);
assign compOut[2] = (i_data[23:16] == greyLevel);
assign compOut[3] = (i_data[31:24] == greyLevel);

always @(posedge i_clk)
begin
	if(~i_reset_n)
		o_histogram <= 0;
	else if(i_data_valid)
		o_histogram <= o_histogram + compOut[0] + compOut[1] + compOut[2] + compOut[3];
end

endmodule	