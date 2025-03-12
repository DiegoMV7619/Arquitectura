`timescale 1ns/1ns

module jericalla(
    input wire [16:0] instruction,
    output [31:0] result,
    output z_flag
);


wire [31:0] data_1;
wire [31:0] data_2;
wire [31:0] alu_result;

ALU alu_inst(
	.sel(instruction[12:9]),
	.data_1(data_1),
	.data_2(data_2),
	.result(alu_result),
	.z_flag(z_flag)	
);

rom rom_inst(
	.address_1(instruction[8:5]),
	.address_2(instruction[4:1]),
	.dout_1(data_1),
	.dout_2(data_2)
);

ram ram_inst(
    .address(instruction[16:13]),
	.din(alu_result),
    .write_enable(instruction[0]),
	.dout(result)
);

endmodule