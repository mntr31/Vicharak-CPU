library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        op1             : in     vl_logic_vector(18 downto 0);
        op2             : in     vl_logic_vector(18 downto 0);
        opcode          : in     vl_logic_vector(4 downto 0);
        alu_result      : out    vl_logic_vector(18 downto 0)
    );
end ALU;
