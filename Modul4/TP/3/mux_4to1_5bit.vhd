ENTITY mux_4to1_5bit IS
PORT (
  D1 : IN std_logic_vector (4 DOWNTO 0); -- Data Input 1
  D2 : IN std_logic_vector (4 DOWNTO 0); -- Data Input 2
  D3 : IN std_logic_vector (4 DOWNTO 0); -- Data Input 3
  D4 : IN std_logic_vector (4 DOWNTO 0); -- Data Input 4
  Y : OUT std_logic_vector (4 DOWNTO 0); -- Selected Data
  S : IN std_logic_vector (1 DOWNTO 0); -- Selector
  );
END mux_4to1_5bit;
