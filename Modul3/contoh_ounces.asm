# contoh_ounces.asm
# Konversi dari ounces ke pounds dan ounce.
  .data
prompt:  .asciiz "Masukkan massa dalam ounces: "
pout: .asciiz " Pounds\n"
ozout:  .asciiz " Ounces\n"

  .text
  .globl main
main:
  addu $s0, $ra, $0
  li $v0,4
  la $a0,prompt
  syscall
  li $v0,5
  syscall
  li $t1,16
  divu $v0,$t1
  mflo $a0
  li $v0,1
  syscall
  li $v0,4
  la $a0,pout
  syscall
  mfhi $a0
  li $v0,1
  syscall
  li $v0,4
  la $a0,ozout
  syscall
  addu $ra, $0, $s0
  jr $ra
# akhir dari program
