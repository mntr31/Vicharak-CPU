//Instruction Fetch 
module InstFetch(input clk, reset, 
						input [18:0] proCount_in,
						output reg [18:0]proCount_next,
						output reg [18:0]instruction);
						
reg [18:0] instructionMemory [0:255]; //256 instructions in Memory

//assign instruction = instructionMemory[proCount_in];

always @(posedge clk or posedge reset)
begin
if (reset)
	begin 
	instruction<=0;
	proCount_next<=0;
	end
	else begin
	instruction <= instructionMemory[proCount_in];//Fetching instruction at program counter input
	proCount_next<=proCount_in+19'b0000000000000000001;
	end
end

endmodule
