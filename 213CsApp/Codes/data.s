	.file	"data.cpp"
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB2078:
	.cfi_startproc
	cmpl	$1, %edi
	je	.L7
.L4:
	ret
.L7:
	cmpl	$65535, %esi
	jne	.L4
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	call	__cxa_atexit@PLT
	movl	$3, 4+x(%rip)
	movl	$5, 8+x(%rip)
	movq	.LC0(%rip), %rax
	movq	%rax, 16+x(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2078:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.globl	_Z6accessPA5_iPPi
	.type	_Z6accessPA5_iPPi, @function
_Z6accessPA5_iPPi:
.LFB1593:
	.cfi_startproc
	endbr64
	movl	28(%rdi), %eax
	movq	8(%rsi), %rdx
	subl	8(%rdx), %eax
	ret
	.cfi_endproc
.LFE1593:
	.size	_Z6accessPA5_iPPi, .-_Z6accessPA5_iPPi
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1594:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$112, %rsp
	.cfi_def_cfa_offset 128
	movl	$40, %ebx
	movq	%fs:(%rbx), %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %rdi
	movq	%rdi, (%rsp)
	leaq	52(%rsp), %rax
	movq	%rax, 8(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	%rsp, %rsi
	call	_Z6accessPA5_iPPi
	movl	%eax, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	leaq	.LC1(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$32, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movsbl	16+x(%rip), %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	104(%rsp), %rax
	xorq	%fs:(%rbx), %rax
	jne	.L12
	movl	$0, %eax
	addq	$112, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1594:
	.size	main, .-main
	.type	_GLOBAL__sub_I_x, @function
_GLOBAL__sub_I_x:
.LFB2079:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2079:
	.size	_GLOBAL__sub_I_x, .-_GLOBAL__sub_I_x
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_x
	.globl	x
	.bss
	.align 32
	.type	x, @object
	.size	x, 32
x:
	.zero	32
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	-1071644672
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
