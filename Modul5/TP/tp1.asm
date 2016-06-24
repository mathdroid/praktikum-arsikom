  .data

  .text
main:
  li	$t1, 0		#  sum = 0   ("load immediate")
  li	$t2, 0		#  i = 0   ("load immediate")

  li	$t3, 10		#  I = 10   ("load immediate")

section_loop:
  beq $t1,$t3,section_exit
  addi $t2,$t2,1
  addi $t1,$t1,1
  j section_loop

section_exit:
  nop
