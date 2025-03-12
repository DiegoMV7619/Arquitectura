`timescale 1ns/1ns

module tb();

reg [16:0] instruction;
wire [31:0] result;
wire z_flag;

jericalla jericalla_inst(
    .instruction(instruction),
    .result(result),
    .z_flag(z_flag)
);

initial begin
    $readmemb("dato.txt",jericalla_inst.rom_inst.mem);
end

initial begin
    instruction = 17'b00110010010001101;
    #10;
    instruction = 17'b0011zzzzzzzzzzzz0;
    #10;
    $stop;
end

endmodule
