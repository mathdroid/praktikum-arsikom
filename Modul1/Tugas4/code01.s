
code01.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	83 c0 01             	add    $0x1,%eax
   8:	3d f4 01 00 00       	cmp    $0x1f4,%eax
   d:	75 f6                	jne    5 <main+0x5>
   f:	48 83 ec 08          	sub    $0x8,%rsp
  13:	be 4e e7 01 00       	mov    $0x1e74e,%esi
  18:	bf 00 00 00 00       	mov    $0x0,%edi
  1d:	b8 00 00 00 00       	mov    $0x0,%eax
  22:	e8 00 00 00 00       	callq  27 <main+0x27>
  27:	b8 4e e7 01 00       	mov    $0x1e74e,%eax
  2c:	48 83 c4 08          	add    $0x8,%rsp
  30:	c3                   	retq   
