ENTITY data_memory IS
PORT (
  ADDR : IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- alamat
  WR_EN : IN STD_LOGIC; --Indikator Penulisan
  RD_EN : IN STD_LOGIC; --Indikator Pembacaan
  clock : IN STD_LOGIC := '1'; -- clock
  RD_Data : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
  WR_Data : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END ENTITY;

COMPONENT altsyncram
-- komponen memori
GENERIC
  (
    init_file : STRING; -- name of the .mif file
    operation_mode : STRING; -- the operation mode
    widthad_a : NATURAL; -- width of address_a[]
    width_a : NATURAL -- width of data_a[]
  );
PORT
  (
    wren_a : IN STD_LOGIC; -- Write Enable Activation
    clock0 : IN STD_LOGIC ; -- Clock
    address_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Address Input
    q_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- Data Output
    data_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0) -- Data Input
  );
END COMPONENT;

altsyncram_component : altsyncram
GENERIC MAP
  (
    init_file => "dmemory.mif",
    operation_mode => "SINGLE_PORT",
    widthad_a => 32,
    width_a => 32
  )
PORT MAP
  (
    wren_a => ???????????, -- isi yang sesuai
    clock0 => clock,
    address_a => ADDR,
    q_a => ???????????, -- isi yang sesuai
    data_a => WR_Data
  );
