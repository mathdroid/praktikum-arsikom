ENTITY mux_2to1_32bit IS
PORT (
  D1 : IN std_logic_vector (31 DOWNTO 0); -- Data Input 1
  D2 : IN std_logic_vector (31 DOWNTO 0); -- Data Input 2
  Y : OUT std_logic_vector (31 DOWNTO 0); -- Selected Data
  S : IN std_logic -- Selector
  );
END mux_2to1_32bit;
