
code0s.o:     file format elf64-x86-64


Disassembly of section .text.startup:

0000000000000000 <main>:
   0:	50                   	push   %rax
   1:	be 4e e7 01 00       	mov    $0x1e74e,%esi
   6:	bf 00 00 00 00       	mov    $0x0,%edi
   b:	31 c0                	xor    %eax,%eax
   d:	e8 00 00 00 00       	callq  12 <main+0x12>
  12:	b8 4e e7 01 00       	mov    $0x1e74e,%eax
  17:	5a                   	pop    %rdx
  18:	c3                   	retq   
