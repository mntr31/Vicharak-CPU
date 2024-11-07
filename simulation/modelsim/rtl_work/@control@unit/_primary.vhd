library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        opcode          : in     vl_logic_vector(4 downto 0);
        regWrite        : out    vl_logic;
        memoryRead      : out    vl_logic;
        memoryWrite     : out    vl_logic;
        branch          : out    vl_logic;
        jump            : out    vl_logic;
        call            : out    vl_logic;
        ret             : out    vl_logic
    );
end ControlUnit;
