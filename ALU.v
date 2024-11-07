module ALU(input[18:0] op1,op2,
				input [4:0] opcode, input [9:0] immediate,
				output reg [18:0] alu_result);
always @(*) 
begin
case(opcode)
	5'b00000: alu_result = op1+op2;
	5'b00001: alu_result = op1-op2;
	5'b00010: alu_result = op1*op2;
	5'b00011: alu_result = op1/op2;
	5'b00100: alu_result = op1&op2;
	5'b00101: alu_result = op1|op2;
	5'b00110: alu_result = op1^op2;
	5'b00111: alu_result = ~op1;
	5'b01000: alu_result = op1*op2 + alu_result; //MAC (Multiply-Accumulate)
	5'b01001: alu_result = op1*op1; //SQR (Square)
	5'b01010: alu_result = (op1>19'b0)?op1: -op1; //ABS (Absolute value)
	5'b01011: alu_result = (op1+op2)>>1; //AVG (Average value, left shifting 1 bit so divided by 2)
	5'b01100: alu_result = op1+19'b0000000000000000001; 
	5'b01101: alu_result = op1-19'b0000000000000000001; 
	5'b01111: alu_result = (op1==op2)?19'b0000000000000000001:19'b0; //BEQ
	5'b10000: alu_result = (op1!=op2)?19'b0000000000000000001:19'b0; //BNE
	5'b10001: alu_result = op1+{{8{immediate[9]}},immediate}; //ADDI
	5'b10010: alu_result = op1-{{8{immediate[9]}},immediate}; //SUBI
	5'b10011: alu_result = op1&{{8{immediate[9]}},immediate}; //ANDI
	5'b10100: alu_result = op1|{{8{immediate[9]}},immediate}; //ORI
		default: alu_result = 19'b0;
		endcase
end

endmodule
