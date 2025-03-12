module ALU(
	input wire [3:0] sel,
	input wire [31:0] data_1,
	input wire [31:0] data_2,
	output reg [31:0] result,
	output reg z_flag	
);

always @* begin
	case(sel)
		4'b0000: result = data_1 & data_2;
		4'b0001: result = data_1 | data_2;
		4'b0010: result = data_1 + data_2;
		4'b0110: result = data_1 - data_2;
		4'b0111: result = (data_1 < data_2) ? 32'd1 : 32'd0;
		4'b1100: result = ~(data_1 | data_2);
	endcase
	
	if(result == 32'd0)
	begin
		z_flag = 1'b1;
	end
	else begin
		z_flag = 1'b0;
	end
end

endmodule