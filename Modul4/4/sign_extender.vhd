ENTITY sign_extender IS
PORT (
    D_In :IN std_logic_vector (15 DOWNTO 0); -- Data Input 1
    D_Out :OUT std_logic_vector (31 DOWNTO 0) -- Data Input 2
  );
END sign_extender;
