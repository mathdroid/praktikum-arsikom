-- Praktikum EL3111 Arsitektur Sistem Komputer
-- Modul : 5
-- Percobaan : 1
-- Tanggal : 1 Desember 2014
-- Kelompok : III
-- Rombongan : A
-- Nama (NIM) 1 : Damon Prasetyo Arso (13212001)
-- Nama (NIM) 2 : Muhammad Mustadi (13210056)
-- Nama File : reg_file.vhd

LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.all; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

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
END ENTITY ;
ARCHITECTURE behavioral OF reg_file IS 
	TYPE ramtype IS ARRAY (31 DOWNTO 0) OF STD_LOGIC_VECTOR (31 DOWNTO 0); 
	SIGNAL mem : ramtype; 
	SIGNAL read1 : STD_LOGIC_VECTOR (31 DOWNTO 0); 
	SIGNAL read2 : STD_LOGIC_VECTOR (31 DOWNTO 0); 
BEGIN 
	RD_Data_1 <= read1; 
	RD_Data_2 <= read2; 
	PROCESS (clock) 
	BEGIN 
		IF (clock'EVENT) AND (clock = '0') THEN 
			read1 <= mem(conv_integer(ADDR_1)); 
			read2 <= mem(conv_integer(ADDR_2)); 
		ELSIF (clock'EVENT) AND (clock = '1') THEN 
			IF (WR_EN = '1') THEN 
				mem( conv_integer(ADDR_3)) <= WR_Data_3;
			END IF; 
		END IF;
	END PROCESS;
	
END behavioral;