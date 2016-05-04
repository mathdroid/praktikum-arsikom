
code03.o:     file format elf64-x86-64


Disassembly of section .text.startup:

0000000000000000 <main>:
   0:	48 83 ec 08          	sub    $0x8,%rsp
   4:	be 4e e7 01 00       	mov    $0x1e74e,%esi
   9:	bf 00 00 00 00       	mov    $0x0,%edi
   e:	31 c0                	xor    %eax,%eax
  10:	e8 00 00 00 00       	callq  15 <main+0x15>
  15:	b8 4e e7 01 00       	mov    $0x1e74e,%eax
  1a:	48 83 c4 08          	add    $0x8,%rsp
  1e:	c3                   	retq   
