`timescale 1ns/1ns

module rom(
	input wire [3:0] address_1,
	input wire [3:0] address_2,
	output reg [31:0] dout_1,
	output reg [31:0] dout_2
);

reg [31:0] mem [0:15];

always @* begin
	dout_1 = mem[address_1];
	dout_2 = mem[address_2];
end


endmodule

