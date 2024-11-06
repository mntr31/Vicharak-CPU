module ControlUnit(input [4:0] opcode,/*changing from 4 bit opcode to 5 bit opcode to accomodate all the instructions*/
							output reg regWrite,memoryRead,memoryWrite,branch,jump,call,ret);
always @(*)begin
case(opcode)
//ADD
5'b00000, 5'b00001,5'b00010,5'b00011,5'b00100,5'b00101,5'b00110,5'b00111,5'b01000,5'b01001,5'b01010,5'b01011,5'b01100,5'b01101: begin
	regWrite = 1;
	memoryRead = 0;
	memoryWrite = 0;
	branch = 0;
	jump = 0;
	call = 0;
	ret = 0;
	end

////SUB
//5'b00001: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//	
////MUL
//5'b00010: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//
////DIV
//5'b00011: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//
////AND
//5'b00100: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//	
////OR
//5'b00101: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//
////XOR
//5'b00110: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//	
////NOT
//5'b00111: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//	
////MAC
//5'b01000: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//	
////SQR
//5'b01001: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//	
////ABS
//5'b01010: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//	
////AVG
//5'b01011: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//
////INC
//5'b01100: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
//	
////DEC
//5'b01101: begin
//	regWrite = 1;
//	memoryRead = 0;
//	memoryWrite = 0;
//	branch = 0;
//	jump = 0;
//	call = 0;
//	ret = 0;
//	end
	
//JMP
5'b01110: begin
	regWrite = 0;
	memoryRead = 0;
	memoryWrite = 0;
	branch = 0;
	jump = 1;
	call = 0;
	ret = 0;
	end

//BEQ
5'b01111: begin
	regWrite = 0;
	memoryRead = 0;
	memoryWrite = 0;
	branch = 1;
	jump = 0;
	call = 0;
	ret = 0;
	end

//BNE
5'b10000: begin
	regWrite = 0;
	memoryRead = 0;
	memoryWrite = 0;
	branch = 1;
	jump = 0;
	call = 0;
	ret = 0;
	end

//CALL
5'b10001: begin
	regWrite = 0;
	memoryRead = 0;
	memoryWrite = 0;
	branch = 0;
	jump = 0;
	call = 1;
	ret = 0;
	end

//RET
5'b10010: begin
	regWrite = 0;
	memoryRead = 0;
	memoryWrite = 0;
	branch = 0;
	jump = 0;
	call = 0;
	ret = 1;
	end

//LD
5'b10011: begin
	regWrite = 0;
	memoryRead = 1;
	memoryWrite = 0;
	branch = 0;
	jump = 0;
	call = 0;
	ret = 0;
	end

//ST	
5'b10100: begin
	regWrite = 0;
	memoryRead = 0;
	memoryWrite = 1;
	branch = 0;
	jump = 0;
	call = 0;
	ret = 0;
	end
	
default: begin
	regWrite = 0;
	memoryRead = 0;
	memoryWrite = 0;
	branch = 0;
	jump = 0;
	call = 0;
	ret = 0;
	end
	endcase
	end
	endmodule


	
	