  .data
string1		.asciiz	"Masukkan jumlah loop: "


	.text
__start:
	li	$t1, 0		#  a = 0   ("load immediate")
	li	$t2, 1		#  x = 1   ("load immediate")

  li	$v0, 4			# load appropriate system call code into register $v0;
	la	$a0, string1		# load address of string to be printed into $a0
	syscall				# call operating system to perform print operation
	done
