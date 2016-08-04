-- Praktikum EL3111 Arsitektur Sistem Komputer
-- Modul : 5
-- Percobaan : 1
-- Tanggal : 1 Desember 2014
-- Kelompok : III
-- Rombongan : A
-- Nama (NIM) 1 : Damon Prasetyo Arso (13212001)
-- Nama (NIM) 2 : Muhammad Mustadi (13210056)
-- Nama File : cu.vhd
-- Deskripsi : Program Control Unit

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY cu IS
PORT (
	OP_In : IN STD_LOGIC_VECTOR (5 DOWNTO 0); 
	FUNCT_In : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
	Sig_Jmp 	: OUT STD_LOGIC;
	Sig_Bne 	: OUT STD_LOGIC; 
	Sig_Branch 	: OUT STD_LOGIC;
	Sig_MemtoReg: OUT STD_LOGIC; 
	Sig_MemRead : OUT STD_LOGIC; 
	Sig_MemWrite: OUT STD_LOGIC;
	Sig_RegDest : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
	Sig_RegWrite: OUT STD_LOGIC; 
	Sig_ALUSrc 	: OUT STD_LOGIC;
	Sig_ALUCtrl : OUT STD_LOGIC
	);
END cu;

ARCHITECTURE behavior OF cu IS
SIGNAL WIRE : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL WIREF : STD_LOGIC_VECTOR(10 DOWNTO 0);
BEGIN
	WITH FUNCT_In SELECT	
		WIREF <= "00000001100" WHEN "100000", --add
				 "00000001101" WHEN "100010", --sub
				 "00000000000" WHEN OTHERS;
	WITH OP_In SELECT
		WIRE <= "00100000000" WHEN "000100", --beq
				"01000000010" WHEN "000101", --bne
				"00000000110" WHEN "001000", --addi
				"00011000110" WHEN "100011", --lw
				"00000100010" WHEN "101011", --sw
				"10000000000" WHEN "000010", --jmp
				WIREF WHEN "000000",
				"00000000000" WHEN OTHERS; --nop
	
	Sig_Jmp			<= WIRE(10);
	Sig_Bne			<= WIRE(9);
	Sig_Branch		<= WIRE(8);
	Sig_MemtoReg	<= WIRE(7);
	Sig_MemRead		<= WIRE(6);
	Sig_MemWrite	<= WIRE(5);
	Sig_RegDest		<= WIRE(4 DOWNTO 3);
	Sig_RegWrite	<= WIRE(2);
	Sig_ALUSrc		<= WIRE(1);
	Sig_ALUCtrl		<= WIRE(0);
END behavior;