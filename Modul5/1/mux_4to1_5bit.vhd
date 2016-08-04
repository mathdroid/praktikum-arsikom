-- Praktikum EL3111 Arsitektur Sistem Komputer
-- Modul : 5
-- Percobaan : 1
-- Tanggal : 1 Desember 2014
-- Kelompok : III
-- Rombongan : A
-- Nama (NIM) 1 : Damon Prasetyo Arso (13212001)
-- Nama (NIM) 2 : Muhammad Mustadi (13210056)
-- Nama File : mux_4to1_5bit.vhd
-- Deskripsi : Program Multiplexer 4-to-1 bit 5 bit


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
--4-to-1 multiplexer
--5 bit
ENTITY mux_4to1_5bit IS
 PORT (
  D1 : IN std_logic_vector (4 DOWNTO 0); -- Data Input 1 
  D2 : IN std_logic_vector (4 DOWNTO 0); -- Data Input 2 
  D3 : IN std_logic_vector (4 DOWNTO 0); -- Data Input 3
  D4 : IN std_logic_vector (4 DOWNTO 0); -- Data Input 4 
  Y : OUT std_logic_vector (4 DOWNTO 0); -- Selected Data
  S : IN std_logic_vector (1 downto 0) -- Selector
 );
END mux_4to1_5bit;

ARCHITECTURE arch OF mux_4to1_5bit IS
BEGIN
		PROCESS (S,D1,D2,D3,D4)
		BEGIN
			IF (S = "00") THEN
				Y <= D1;
			ELSIF (S = "01") THEN
				Y <= D2;
			ELSIF (S="10") THEN
				Y <= D3;
			ELSIF (S="11") THEN
				Y <= D4;
			END IF;
		END PROCESS; 

END arch;
