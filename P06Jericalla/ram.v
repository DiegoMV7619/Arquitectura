`timescale 1ns/1ns

module ram(
	input wire [3:0] address,
	input wire [31:0] din,
	input wire write_enable,
	output reg [31:0] dout
);

reg [31:0] mem [0:15];

always @* begin
	if (write_enable == 1'b1) begin
		mem[address] = din;
	end
	else begin
		dout = mem[address];
	end
	
end


endmodule
