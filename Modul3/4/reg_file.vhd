ENTITY reg_file IS
PORT (
  clock : IN STD_LOGIC; -- clock
  WR_EN : IN STD_LOGIC; -- write enable
  ADDR_1 : IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- Input 1
  ADDR_2 : IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- Input 2
  ADDR_3 : IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- Input 3
  WR_Data_3 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);-- write data
  RD_Data_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);-- read data 1
  RD_Data_2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- read data 2
  );
END ENTITY;

TYPE ramtype IS ARRAY (31 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL mem: ramtype;
