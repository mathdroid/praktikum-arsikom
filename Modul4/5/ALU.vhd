ENTITY ALU IS
PORT (
    OPRND_1 : IN std_logic_vector (31 DOWNTO 0); -- Data Input 1
    OPRND_2 : IN std_logic_vector (31 DOWNTO 0); -- Data Input 2
    OP_SEL : IN std_logic_vector (1 DOWNTO 0); -- Operation Select
    RESULT : OUT std_logic_vector (31 DOWNTO 0) -- Data Output
  );
END ALU;
