ENTITY cla_32 IS
PORT (
    OPRND_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- Operand 1
    OPRND_2 : IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Operand 2
    C_IN : IN STD_LOGIC; -- Carry In
    RESULT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- Result
    C_OUT : OUT STD_LOGIC -- Overflow
  );
END cla_32;
