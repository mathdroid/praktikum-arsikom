
code0.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 10          	sub    $0x10,%rsp
   8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  16:	eb 0a                	jmp    22 <main+0x22>
  18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  1b:	01 45 f8             	add    %eax,-0x8(%rbp)
  1e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  22:	81 7d fc f3 01 00 00 	cmpl   $0x1f3,-0x4(%rbp)
  29:	7e ed                	jle    18 <main+0x18>
  2b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  2e:	89 c6                	mov    %eax,%esi
  30:	bf 00 00 00 00       	mov    $0x0,%edi
  35:	b8 00 00 00 00       	mov    $0x0,%eax
  3a:	e8 00 00 00 00       	callq  3f <main+0x3f>
  3f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  42:	c9                   	leaveq 
  43:	c3                   	retq   
