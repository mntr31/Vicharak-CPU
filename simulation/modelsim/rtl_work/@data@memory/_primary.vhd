library verilog;
use verilog.vl_types.all;
entity DataMemory is
    port(
        clk             : in     vl_logic;
        memoryRead      : in     vl_logic;
        memoryWrite     : in     vl_logic;
        address         : in     vl_logic_vector(18 downto 0);
        data_in         : in     vl_logic_vector(18 downto 0);
        data_out        : out    vl_logic_vector(18 downto 0)
    );
end DataMemory;
