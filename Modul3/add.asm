# Program untuk menjumlahkan 7 dengan 5
  .text
  .globl main
main:
  ori $8,$0,0x07 # masukkan angka 7 ke register 8
  ori $9,$0,0x05 # masukkan angka 5 ke register 9
  addu $10,$8,$9 # jumlahkan dan simpan hasilnya di register 10
# akhir dari program
