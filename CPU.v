module CPU(input clk,reset);

// 19 bit architecture
wire [18:0] proCount, proCount_next, proCount_update, writeData, instruction, alu_result, memoryData; // Program Counter, Instruction, result of ALU and other data of 19 bit
wire [18:0] data1,data2,address;
wire [4:0]  opcode;
wire [3:0]  rs1,rs2,rd; // Address of source, destination registers of 4 bits, total 16 registers
wire [10:0] immediate; // Immediate value
wire regWrite,memoryRead, memoryWrite, branch, jump, call, ret; // Other signals

//We will instantiate the modules
ProgramCounter pc(.clk(clk), .reset(reset),.update(proCount_update),.branch(branch),.jump(jump),.call(call),.ret(ret),
						.proCount_in(proCount_next),.jumpAdderess(address), .proCount_out(proCount));
						
InstFetch instfetch_module(.clk(clk), .reset(reset), .proCount_in(proCount), .proCount_next(proCount_next),.instruction(instruction));

InstDeco instdeco_module(.instruction(instruction), .opcode(opcode),.rs1(rs1),.rs2(rs2),.rd(rd),.immediate(immediate));

RegisterFile rfile(.clk(clk),.regWrite(regWrite), .readRegister1(rs1), .readRegister2(rs2), .writeRegister(rd), 
						 .writeData(writeData), .data1(data1), .data2(data2));

ALU alumodule(.op1(data1),.op2(data2),.opcode(opcode), .alu_result(alu_result));

ControlUnit cumodule(.opcode(opcode), .regWrite(regWrite), .memoryRead(memoryRead),.memoryWrite(memoryWrite),
							.branch(branch),.jump(jump),.call(call),.ret(ret));

DataMemory dmmodule(.clk(clk),.memoryRead(memoryRead),.memoryWrite(memoryWrite),.address(alu_result),.data_in(data2),.data_out(memoryData));

endmodule
