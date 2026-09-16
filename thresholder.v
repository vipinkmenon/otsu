module thresholder #(parameter dataWidth = 32)(
input	                   i_clk,
input 	[dataWidth-1:0]    i_data,
output reg [dataWidth-1:0] o_data,
input  [7 :0]              i_threshold
);

integer i;

always @(posedge i_clk)
begin
	for(i=0;i<4;i=i+1)
	begin
		if(i_data[i*8+:8] < i_threshold)
			o_data[i*8+:8] <= 8'h0;
		else
			o_data[i*8+:8] <= 8'hff;
	end
end

endmodule