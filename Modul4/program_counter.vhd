ENTITY program_counter IS
PORT (
    clk : IN STD_LOGIC;
    PC_in : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    PC_out : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END program_counter;
