ENTITY comparator IS
PORT (
  D_1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
  D_2 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
  EQ : OUT STD_LOGIC -- Hasil Perbandingan EQ
  );
END comparator;
