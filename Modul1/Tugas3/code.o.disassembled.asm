
code.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  12:	eb 0a                	jmp    1e <main+0x1e>
  14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  17:	01 45 f8             	add    %eax,-0x8(%rbp)
  1a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  1e:	81 7d fc f3 01 00 00 	cmpl   $0x1f3,-0x4(%rbp)
  25:	7e ed                	jle    14 <main+0x14>
  27:	8b 45 f8             	mov    -0x8(%rbp),%eax
  2a:	5d                   	pop    %rbp
  2b:	c3                   	retq   
