	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%f\t"
.LC1:
	.string	"%d \t %d\n"
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB40:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%esi, 8(%rsp)
	movl	%edx, 12(%rsp)
	testl	%esi, %esi
	jle	.L2
	movq	%rdi, %r12
	movl	%edx, %r15d
	movl	$0, %eax
	movl	$0, %r14d
.L5:
	movl	%eax, %ebx
	addl	$1, %r14d
	leal	(%r15,%rax), %r13d
	movl	%r13d, %ebp
	cmpl	%r13d, %eax
	jge	.L3
.L4:
	movslq	%ebx, %rax
	movss	(%r12,%rax,4), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	addl	$1, %ebx
	cmpl	%ebp, %ebx
	jl	.L4
.L3:
	movl	$10, %edi
	call	putchar
	cmpl	8(%rsp), %r14d
	je	.L2
	movl	%r13d, %eax
	jmp	.L5
.L2:
	movl	12(%rsp), %ecx
	movl	8(%rsp), %edx
	movl	$.LC1, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	print_matrix, .-print_matrix
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$48, %edi
	call	malloc
	movl	$0, %edx
.L9:
	cvtsi2ss	%edx, %xmm0
	movss	%xmm0, (%rax,%rdx,4)
	addq	$1, %rdx
	cmpq	$12, %rdx
	jne	.L9
	movb	$4, %dl
	movl	$3, %esi
	movq	%rax, %rdi
	call	print_matrix
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc // something here
.LFE39:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
