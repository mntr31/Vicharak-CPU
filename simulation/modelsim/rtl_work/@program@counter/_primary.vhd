library verilog;
use verilog.vl_types.all;
entity ProgramCounter is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        update          : in     vl_logic;
        branch          : in     vl_logic;
        jump            : in     vl_logic;
        call            : in     vl_logic;
        ret             : in     vl_logic;
        proCount_in     : in     vl_logic_vector(18 downto 0);
        jumpAdderess    : in     vl_logic_vector(18 downto 0);
        proCount_out    : out    vl_logic_vector(18 downto 0)
    );
end ProgramCounter;
