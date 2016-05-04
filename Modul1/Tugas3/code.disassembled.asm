
code:     file format elf64-x86-64


Disassembly of section .init:

0000000000400358 <_init>:
  400358:	48 83 ec 08          	sub    $0x8,%rsp
  40035c:	48 8b 05 15 05 20 00 	mov    0x200515(%rip),%rax        # 600878 <_DYNAMIC+0x1d0>
  400363:	48 85 c0             	test   %rax,%rax
  400366:	74 05                	je     40036d <_init+0x15>
  400368:	e8 33 00 00 00       	callq  4003a0 <__libc_start_main@plt+0x10>
  40036d:	48 83 c4 08          	add    $0x8,%rsp
  400371:	c3                   	retq   

Disassembly of section .plt:

0000000000400380 <__libc_start_main@plt-0x10>:
  400380:	ff 35 02 05 20 00    	pushq  0x200502(%rip)        # 600888 <_GLOBAL_OFFSET_TABLE_+0x8>
  400386:	ff 25 04 05 20 00    	jmpq   *0x200504(%rip)        # 600890 <_GLOBAL_OFFSET_TABLE_+0x10>
  40038c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400390 <__libc_start_main@plt>:
  400390:	ff 25 02 05 20 00    	jmpq   *0x200502(%rip)        # 600898 <_GLOBAL_OFFSET_TABLE_+0x18>
  400396:	68 00 00 00 00       	pushq  $0x0
  40039b:	e9 e0 ff ff ff       	jmpq   400380 <_init+0x28>

Disassembly of section .plt.got:

00000000004003a0 <.plt.got>:
  4003a0:	ff 25 d2 04 20 00    	jmpq   *0x2004d2(%rip)        # 600878 <_DYNAMIC+0x1d0>
  4003a6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000004003b0 <_start>:
  4003b0:	31 ed                	xor    %ebp,%ebp
  4003b2:	49 89 d1             	mov    %rdx,%r9
  4003b5:	5e                   	pop    %rsi
  4003b6:	48 89 e2             	mov    %rsp,%rdx
  4003b9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4003bd:	50                   	push   %rax
  4003be:	54                   	push   %rsp
  4003bf:	49 c7 c0 50 05 40 00 	mov    $0x400550,%r8
  4003c6:	48 c7 c1 e0 04 40 00 	mov    $0x4004e0,%rcx
  4003cd:	48 c7 c7 a6 04 40 00 	mov    $0x4004a6,%rdi
  4003d4:	e8 b7 ff ff ff       	callq  400390 <__libc_start_main@plt>
  4003d9:	f4                   	hlt    
  4003da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004003e0 <deregister_tm_clones>:
  4003e0:	b8 b7 08 60 00       	mov    $0x6008b7,%eax
  4003e5:	55                   	push   %rbp
  4003e6:	48 2d b0 08 60 00    	sub    $0x6008b0,%rax
  4003ec:	48 83 f8 0e          	cmp    $0xe,%rax
  4003f0:	48 89 e5             	mov    %rsp,%rbp
  4003f3:	76 1b                	jbe    400410 <deregister_tm_clones+0x30>
  4003f5:	b8 00 00 00 00       	mov    $0x0,%eax
  4003fa:	48 85 c0             	test   %rax,%rax
  4003fd:	74 11                	je     400410 <deregister_tm_clones+0x30>
  4003ff:	5d                   	pop    %rbp
  400400:	bf b0 08 60 00       	mov    $0x6008b0,%edi
  400405:	ff e0                	jmpq   *%rax
  400407:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40040e:	00 00 
  400410:	5d                   	pop    %rbp
  400411:	c3                   	retq   
  400412:	0f 1f 40 00          	nopl   0x0(%rax)
  400416:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40041d:	00 00 00 

0000000000400420 <register_tm_clones>:
  400420:	be b0 08 60 00       	mov    $0x6008b0,%esi
  400425:	55                   	push   %rbp
  400426:	48 81 ee b0 08 60 00 	sub    $0x6008b0,%rsi
  40042d:	48 c1 fe 03          	sar    $0x3,%rsi
  400431:	48 89 e5             	mov    %rsp,%rbp
  400434:	48 89 f0             	mov    %rsi,%rax
  400437:	48 c1 e8 3f          	shr    $0x3f,%rax
  40043b:	48 01 c6             	add    %rax,%rsi
  40043e:	48 d1 fe             	sar    %rsi
  400441:	74 15                	je     400458 <register_tm_clones+0x38>
  400443:	b8 00 00 00 00       	mov    $0x0,%eax
  400448:	48 85 c0             	test   %rax,%rax
  40044b:	74 0b                	je     400458 <register_tm_clones+0x38>
  40044d:	5d                   	pop    %rbp
  40044e:	bf b0 08 60 00       	mov    $0x6008b0,%edi
  400453:	ff e0                	jmpq   *%rax
  400455:	0f 1f 00             	nopl   (%rax)
  400458:	5d                   	pop    %rbp
  400459:	c3                   	retq   
  40045a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400460 <__do_global_dtors_aux>:
  400460:	80 3d 49 04 20 00 00 	cmpb   $0x0,0x200449(%rip)        # 6008b0 <__TMC_END__>
  400467:	75 11                	jne    40047a <__do_global_dtors_aux+0x1a>
  400469:	55                   	push   %rbp
  40046a:	48 89 e5             	mov    %rsp,%rbp
  40046d:	e8 6e ff ff ff       	callq  4003e0 <deregister_tm_clones>
  400472:	5d                   	pop    %rbp
  400473:	c6 05 36 04 20 00 01 	movb   $0x1,0x200436(%rip)        # 6008b0 <__TMC_END__>
  40047a:	f3 c3                	repz retq 
  40047c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400480 <frame_dummy>:
  400480:	bf a0 06 60 00       	mov    $0x6006a0,%edi
  400485:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400489:	75 05                	jne    400490 <frame_dummy+0x10>
  40048b:	eb 93                	jmp    400420 <register_tm_clones>
  40048d:	0f 1f 00             	nopl   (%rax)
  400490:	b8 00 00 00 00       	mov    $0x0,%eax
  400495:	48 85 c0             	test   %rax,%rax
  400498:	74 f1                	je     40048b <frame_dummy+0xb>
  40049a:	55                   	push   %rbp
  40049b:	48 89 e5             	mov    %rsp,%rbp
  40049e:	ff d0                	callq  *%rax
  4004a0:	5d                   	pop    %rbp
  4004a1:	e9 7a ff ff ff       	jmpq   400420 <register_tm_clones>

00000000004004a6 <main>:
  4004a6:	55                   	push   %rbp
  4004a7:	48 89 e5             	mov    %rsp,%rbp
  4004aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  4004b1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  4004b8:	eb 0a                	jmp    4004c4 <main+0x1e>
  4004ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4004bd:	01 45 f8             	add    %eax,-0x8(%rbp)
  4004c0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  4004c4:	81 7d fc f3 01 00 00 	cmpl   $0x1f3,-0x4(%rbp)
  4004cb:	7e ed                	jle    4004ba <main+0x14>
  4004cd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  4004d0:	5d                   	pop    %rbp
  4004d1:	c3                   	retq   
  4004d2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4004d9:	00 00 00 
  4004dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004004e0 <__libc_csu_init>:
  4004e0:	41 57                	push   %r15
  4004e2:	41 56                	push   %r14
  4004e4:	41 89 ff             	mov    %edi,%r15d
  4004e7:	41 55                	push   %r13
  4004e9:	41 54                	push   %r12
  4004eb:	4c 8d 25 9e 01 20 00 	lea    0x20019e(%rip),%r12        # 600690 <__frame_dummy_init_array_entry>
  4004f2:	55                   	push   %rbp
  4004f3:	48 8d 2d 9e 01 20 00 	lea    0x20019e(%rip),%rbp        # 600698 <__init_array_end>
  4004fa:	53                   	push   %rbx
  4004fb:	49 89 f6             	mov    %rsi,%r14
  4004fe:	49 89 d5             	mov    %rdx,%r13
  400501:	4c 29 e5             	sub    %r12,%rbp
  400504:	48 83 ec 08          	sub    $0x8,%rsp
  400508:	48 c1 fd 03          	sar    $0x3,%rbp
  40050c:	e8 47 fe ff ff       	callq  400358 <_init>
  400511:	48 85 ed             	test   %rbp,%rbp
  400514:	74 20                	je     400536 <__libc_csu_init+0x56>
  400516:	31 db                	xor    %ebx,%ebx
  400518:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40051f:	00 
  400520:	4c 89 ea             	mov    %r13,%rdx
  400523:	4c 89 f6             	mov    %r14,%rsi
  400526:	44 89 ff             	mov    %r15d,%edi
  400529:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40052d:	48 83 c3 01          	add    $0x1,%rbx
  400531:	48 39 eb             	cmp    %rbp,%rbx
  400534:	75 ea                	jne    400520 <__libc_csu_init+0x40>
  400536:	48 83 c4 08          	add    $0x8,%rsp
  40053a:	5b                   	pop    %rbx
  40053b:	5d                   	pop    %rbp
  40053c:	41 5c                	pop    %r12
  40053e:	41 5d                	pop    %r13
  400540:	41 5e                	pop    %r14
  400542:	41 5f                	pop    %r15
  400544:	c3                   	retq   
  400545:	90                   	nop
  400546:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40054d:	00 00 00 

0000000000400550 <__libc_csu_fini>:
  400550:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400554 <_fini>:
  400554:	48 83 ec 08          	sub    $0x8,%rsp
  400558:	48 83 c4 08          	add    $0x8,%rsp
  40055c:	c3                   	retq   
