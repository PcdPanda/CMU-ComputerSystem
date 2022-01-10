	.file	"ass.cpp"
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB2076:
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
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2076:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.globl	_Z5arithlll
	.type	_Z5arithlll, @function
_Z5arithlll:
.LFB1590:
	.cfi_startproc
	endbr64
	movq	%rdx, %rax
	leaq	(%rdi,%rsi), %rdx
	addq	%rdx, %rax
	leaq	(%rsi,%rsi,2), %rdx
	salq	$4, %rdx
	leaq	4(%rdi,%rdx), %rdx
	imulq	%rdx, %rax
	ret
	.cfi_endproc
.LFE1590:
	.size	_Z5arithlll, .-_Z5arithlll
	.globl	_Z7absdiffll
	.type	_Z7absdiffll, @function
_Z7absdiffll:
.LFB1592:
	.cfi_startproc
	endbr64
	movq	%rsi, %rax
	cmpq	%rsi, %rdi
	jge	.L10
	subq	%rdi, %rax
	ret
.L10:
	subq	%rsi, %rdi
	movq	%rdi, %rax
	ret
	.cfi_endproc
.LFE1592:
	.size	_Z7absdiffll, .-_Z7absdiffll
	.globl	_Z5greatii
	.type	_Z5greatii, @function
_Z5greatii:
.LFB1593:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%edi, %rbx
	movslq	%esi, %rsi
	movq	%rbx, %rdi
	call	_Z7absdiffll
	cmpq	%rax, %rbx
	setg	%al
	movzbl	%al, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1593:
	.size	_Z5greatii, .-_Z5greatii
	.globl	_Z3sumiiiiiiii
	.type	_Z3sumiiiiiiii, @function
_Z3sumiiiiiiii:
.LFB1594:
	.cfi_startproc
	endbr64
	addl	%esi, %edi
	addl	%edx, %edi
	addl	%ecx, %edi
	addl	%r8d, %edi
	addl	%r9d, %edi
	movl	%edi, %eax
	addl	8(%rsp), %eax
	addl	16(%rsp), %eax
	ret
	.cfi_endproc
.LFE1594:
	.size	_Z3sumiiiiiiii, .-_Z3sumiiiiiiii
	.section	.text._Z4swapIiEiPT_S1_,"axG",@progbits,_Z4swapIiEiPT_S1_,comdat
	.weak	_Z4swapIiEiPT_S1_
	.type	_Z4swapIiEiPT_S1_, @function
_Z4swapIiEiPT_S1_:
.LFB1831:
	.cfi_startproc
	endbr64
	movl	(%rdi), %eax
	movl	(%rsi), %edx
	movl	%edx, (%rdi)
	movl	%eax, (%rsi)
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE1831:
	.size	_Z4swapIiEiPT_S1_, .-_Z4swapIiEiPT_S1_
	.text
	.globl	main
	.type	main, @function
main:
.LFB1595:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	$4, (%rsp)
	movl	$0, %ebx
.L18:
	pushq	$8
	.cfi_def_cfa_offset 40
	pushq	$7
	.cfi_def_cfa_offset 48
	movl	$6, %r9d
	movl	$5, %r8d
	movl	$4, %ecx
	movl	$3, %edx
	movl	$2, %esi
	movl	$1, %edi
	call	_Z3sumiiiiiiii
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	cmpl	%ebx, %eax
	jle	.L17
	addl	$1, (%rsp)
	addl	$1, %ebx
	jmp	.L18
.L17:
	movl	$5, 4(%rsp)
	leaq	4(%rsp), %rsi
	movq	%rsp, %rdi
	call	_Z4swapIiEiPT_S1_
	movl	$0, %edx
.L20:
	cmpq	$5, %rdx
	jg	.L24
	addl	$1, (%rsp)
	movl	4(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 4(%rsp)
	addq	$1, %rdx
	jmp	.L20
.L24:
	movl	$0, %ebx
.L19:
	cmpl	%ebx, 4(%rsp)
	jle	.L25
	movl	$2, %esi
	movl	$1, %edi
	call	_Z5greatii
	movl	%eax, (%rsp)
	addl	$1, %ebx
	jmp	.L19
.L25:
	movl	$1, %eax
.L21:
	cmpl	$2, %eax
	jg	.L22
	addl	$1, %eax
	jmp	.L21
.L22:
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L27
	movl	$0, %eax
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L27:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1595:
	.size	main, .-main
	.type	_GLOBAL__sub_I__Z5arithlll, @function
_GLOBAL__sub_I__Z5arithlll:
.LFB2077:
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
.LFE2077:
	.size	_GLOBAL__sub_I__Z5arithlll, .-_GLOBAL__sub_I__Z5arithlll
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z5arithlll
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
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
