-- Praktikum EL3111 Arsitektur Sistem Komputer
-- Modul : 5
-- Percobaan : 1
-- Tanggal : 1 Desember 2014
-- Kelompok : III
-- Rombongan : A
-- Nama (NIM) 1 : Damon Prasetyo Arso (13212001)
-- Nama (NIM) 2 : Muhammad Mustadi (13210056)
-- Nama File : lshift_32_32.vhd
-- Deskripsi : Program Left Shifter 32 bit to 32 bit

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY lshift_32_32  IS
PORT (
	D_IN		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
	D_OUT		:	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END lshift_32_32;

ARCHITECTURE behavior OF lshift_32_32 IS
BEGIN
	D_OUT <= D_IN (29 DOWNTO 0) & "00";
END behavior;