module ProgramCounter(input clk, reset,update,branch,jump,call,ret,
							 input [18:0] proCount_in,jumpAdderess,
							 output reg [18:0] proCount_out);

reg [18:0] stack [0:15]; //Stack for call and ret
reg [3:0] stackPointer;
//Behavoiral modeling
always @(posedge clk or posedge reset)
begin
			if(reset)
			begin
			proCount_out<=0;
			stackPointer<=0;
			end
			
			else if(ret)
			begin
			stackPointer<=stackPointer+4'b0001;
			proCount_out<=stack[stackPointer];//In ret, stackPointer updates and program counter goes back to previous pointer
			end
			
			else if(call)
			begin
			stack[stackPointer]<=proCount_out+4'b0001;
			stackPointer<=stackPointer-4'b0001;
			proCount_out<=jumpAdderess;
			end
			
			else if(branch)
			begin
			proCount_out<=jumpAdderess;
			end
			
			else if(jump)
			begin
			proCount_out<=jumpAdderess;
			end
			
			else /*if(update)*/
			begin
			proCount_out<=proCount_in;
			end
end
endmodule
