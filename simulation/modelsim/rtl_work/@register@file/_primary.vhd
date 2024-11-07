library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        clk             : in     vl_logic;
        regWrite        : in     vl_logic;
        readRegister1   : in     vl_logic_vector(3 downto 0);
        readRegister2   : in     vl_logic_vector(3 downto 0);
        writeRegister   : in     vl_logic_vector(3 downto 0);
        writeData       : in     vl_logic_vector(18 downto 0);
        data1           : out    vl_logic_vector(18 downto 0);
        data2           : out    vl_logic_vector(18 downto 0)
    );
end RegisterFile;
