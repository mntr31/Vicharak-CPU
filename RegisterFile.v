module RegisterFile(input clk,regWrite,
							input[3:0] readRegister1, readRegister2, writeRegister,
							input [18:0] writeData,
							output [18:0] data1, data2);
reg [18:0] registers [0:15]; //16 registers, all 19 bits wide

assign data1 = registers[readRegister1];
assign data2 = registers[readRegister2];

always @(posedge clk)
begin
	if(regWrite)
	begin
	registers[writeRegister]<=writeData;
	end
	end
	endmodule
