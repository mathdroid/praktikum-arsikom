addi $s0, $0, 19 		# $s0 = 0 + 19
addi $s1, $0, 21 		# $s1 = 0 + 21
bne $s2, $s3, 8 		# if($s2 != $s3), PC <- (PC+4)+(4*8)
nop
sub $s3, $s0, $s1 		# $s3 = $s0 - $s1
addi $s3, $s3, 0 		# $s3 = $s3 + 0
addi $s4, $s0, 4 		# $s4 = $s0 + 4
sw $s1, ($s4) 			# M($s4) = $s1
lw $s5, ($s4) 			# $s5 = M($s4)
add $s5, $s5, $0 		# $s5 = 0 + $s5
j 00000000			# PC <- 0x(PC(31:28))0000000
nop
