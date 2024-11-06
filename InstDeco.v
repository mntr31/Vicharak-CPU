//Instruction Decoder
module InstDeco(input [18:0] instruction,
						output reg [4:0] opcode,
						output reg [3:0]rs1,rs2,rd,
						output reg [10:0] immediate);

always @(*)
begin
	opcode = instruction[18:14]; //5 bits of MSB are opcode
	rs1 = instruction[13:10]; //4 bit Address of source register 1 
	rs2 = instruction[9:6]; //4 bit Address of source register 2
	rd = instruction[5:2]; // 4 bit Address of destination register, 2 bits unused if no immediate value
	immediate = instruction[10:0]; // 11 bit immediate value
end
endmodule
