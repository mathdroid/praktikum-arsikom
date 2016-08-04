-- Praktikum EL3111 Arsitektur Sistem Komputer
-- Modul : 5
-- Percobaan : 1
-- Tanggal : 1 Desember 2014
-- Kelompok : III
-- Rombongan : A
-- Nama (NIM) 1 : Damon Prasetyo Arso (13212001)
-- Nama (NIM) 2 : Muhammad Mustadi (13210056)
-- Nama File : bus_merger.vhd
-- Deskripsi : Program Bus Merger

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY bus_merger IS
PORT (
DATA_IN1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
DATA_IN2 : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
DATA_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
);
END bus_merger;

ARCHITECTURE bmerge OF bus_merger IS
BEGIN
DATA_OUT(31 DOWNTO 28) <= DATA_IN1;
DATA_OUT(27 DOWNTO 0) <= DATA_IN2;
END bmerge;
