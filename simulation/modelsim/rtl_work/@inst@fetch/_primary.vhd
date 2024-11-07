library verilog;
use verilog.vl_types.all;
entity InstFetch is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        proCount_in     : in     vl_logic_vector(18 downto 0);
        proCount_next   : out    vl_logic_vector(18 downto 0);
        instruction     : out    vl_logic_vector(18 downto 0)
    );
end InstFetch;
