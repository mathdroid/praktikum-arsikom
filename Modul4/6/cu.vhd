ENTITY cu IS
PORT (
    OP_In : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    FUNCT_In : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    Sig_Jmp : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    Sig_Bne : OUT STD_LOGIC;
    Sig_Branch : OUT STD_LOGIC;
    Sig_MemtoReg : OUT STD_LOGIC;
    Sig_MemRead : OUT STD_LOGIC;
    Sig_MemWrite : OUT STD_LOGIC;
    Sig_RegDest : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    Sig_RegWrite : OUT STD_LOGIC;
    Sig_ALUSrc : OUT STD_LOGIC;
    Sig_ALUCtrl : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END cu;
