-- PRAKTIKUM EL 3111 ARSITEKTUR SISTEM KOMPUTER
-- MODUL 4
-- PERCOBAAN 2
-- 17 NOV 2014
-- KELOMPOK VI
-- ROMBONGAN A
-- DAMON PRASETYO ARSO (13212001)
-- MUHAMMAD MUSTADI (13210056)
-- cla32.vhdl
-- CARRY LOOK ADDER
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.ALL;

ENTITY cla_32 IS
PORT (
  OPRND_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- Operand 1
  OPRND_2 : IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Operand 2
  C_IN : IN STD_LOGIC; -- Carry In
  RESULT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- Result
  C_OUT : OUT STD_LOGIC -- Overflow
);
END cla_32;

ARCHITECTURE behavior OF cla_32 IS
    SIGNAL    h_sum              :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL    carry_generate     :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL    carry_propagate    :    STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL    carry_in_internal  :    STD_LOGIC_VECTOR(31 DOWNTO 1);
	
BEGIN
	h_sum <= OPRND_1 XOR OPRND_2;
    carry_generate <= OPRND_1 AND OPRND_2;
    carry_propagate <= OPRND_1 OR OPRND_2;
  PROCESS (OPRND_1,OPRND_2,C_IN)
  BEGIN
	carry_in_internal(1) <= carry_generate(0) OR (carry_propagate(0) AND C_IN);
        inst: FOR i IN 1 TO 30 LOOP
              carry_in_internal(i+1) <= carry_generate(i) OR (carry_propagate(i) AND carry_in_internal(i));
              END LOOP;
    C_OUT <= carry_generate(31) OR (carry_propagate(31) AND carry_in_internal(31));
  --C_OUT <= C_IN;
  --RESULT(31 DOWNTO 0) <= OPRND_1(31 DOWNTO 0) + OPRND_2(31 DOWNTO 0);
  END PROCESS;
  RESULT(0) <= h_sum(0) XOR C_IN;
  RESULT(31 DOWNTO 1) <= h_sum(31 DOWNTO 1) XOR carry_in_internal(31 DOWNTO 1);
END behavior;
