-- Praktikum EL3111 Arsitektur Sistem Komputer
-- Modul : 5
-- Percobaan : 1
-- Tanggal : 1 Desember 2014
-- Kelompok : III
-- Rombongan : A
-- Nama (NIM) 1 : Damon Prasetyo Arso (13212001)
-- Nama (NIM) 2 : Muhammad Mustadi (13210056)
-- Nama File : cla_32.vhd

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY cla_32 IS
PORT (
	OPRND_1	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	OPRND_2	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	C_IN	: IN STD_LOGIC;
	RESULT	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	C_OUT	: OUT STD_LOGIC
	);
END cla_32;

ARCHITECTURE BEHAVIORAL OF cla_32 IS
SIGNAL x	: STD_LOGIC_VECTOR (31 DOWNTO 0);
BEGIN
	PROCESS (OPRND_1, OPRND_2, C_IN)
	BEGIN
		x(0) <= (OPRND_1 (0) AND OPRND_2(0)) OR (OPRND_1(0) AND C_IN) OR (OPRND_2(0) AND C_IN);
		RESULT (0) <= OPRND_1(0) XOR OPRND_2(0) XOR C_IN;
		
		FOR i IN 1 TO 31 LOOP
			x(i) <= (OPRND_1(i) AND OPRND_2(i)) OR (OPRND_1(i) AND x(i-1)) OR (OPRND_2(i) AND x(i-1));
			RESULT(i) <= OPRND_1 (i) XOR OPRND_2(i) XOR x(i-1);
		END LOOP;
		C_OUT <= x(31);
	END PROCESS;
END BEHAVIORAL;