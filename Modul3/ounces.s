	.file	"ounces.c"
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d Pounds\n"
.LC2:
	.string	"%d Ounces\n"
	.text
	.globl	test
	.type	test, @function
test:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-4(%rbp), %eax
	leal	15(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$4, %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	-4(%rbp), %eax
	cltd
	shrl	$28, %edx
	addl	%edx, %eax
	andl	$15, %eax
	subl	%edx, %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	test, .-test
	.section	.rodata
.LC3:
	.string	"Masukkan massa dalam ounces: "
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	call	test
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.1.1 20160602"
	.section	.note.GNU-stack,"",@progbits