  .data
string1: .asciiz "Masukkan jumlah loop: "
string2: .asciiz "Hasil iterasi: "
endline: .asciiz "\n"

	.text
main:
	li	$t1, 0		#  a = 0   ("load immediate")
	li	$t2, 1		#  x = 1   ("load immediate")

  li $v0, 4 # system call code for printing string = 4
  la $a0, string1 # load address of string to be printed into $a0
  syscall # call operating system to perform operation
  # specified in $v0
  # syscall takes its arguments from $a0, $a1, ...

  li	$v0, 5			# load appropriate system call code into register $v0;
	# code for reading integer is 5
	syscall				# call operating system to perform operation
	move $t3, $v0		# value read from keyboard returned in register $v0;
	# store this in desired location

section_loop:
  bge $t1,$t3,section_exit
  sll $t2,$t2,2
  addi $t1,$t1,1
  j section_loop

section_exit:
  li $v0, 4 # system call code for printing string = 4
  la $a0, string2 # load address of string to be printed into $a0
  syscall # call operating system to perform operation

  li	$v0, 1			# load appropriate system call code into register $v0;
	move	$a0, $t2		# move integer to be printed into $a0:  $a0 = $t2
	syscall				# call operating system to perform operation


  li $v0, 4 # system call code for printing string = 4
  la $a0, endline # load address of string to be printed into $a0
  syscall # call operating system to perform operation

  li $v0, 10 # terminate program
  syscall
