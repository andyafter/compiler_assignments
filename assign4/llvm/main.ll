	.file	"main.c"
	.section	.rodata
.LC0:
	.string	"%d\n"
.LC2:
	.string	"Starting everything!!!"
.LC4:
	.string	"time spent: %f \n"
.LC5:
	.string	"Seems good! "
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	call	clock
	movq	%rax, -48(%rbp)
	movl	$2400000000, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movabsq	$4800000000, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$3200000000, %edi
	call	malloc
	movq	%rax, -24(%rbp)
	movl	$4, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -52(%rbp)
	jmp	.L2
.L3:
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	cvtsi2ss	-52(%rbp), %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -52(%rbp)
.L2:
	cmpl	$599999999, -52(%rbp)
	jle	.L3
	movl	$0, -52(%rbp)
	jmp	.L4
.L5:
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	cvtsi2ss	-52(%rbp), %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -52(%rbp)
.L4:
	cmpl	$1199999999, -52(%rbp)
	jle	.L5
	movl	$0, -52(%rbp)
	jmp	.L6
.L7:
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	.LC1(%rip), %eax
	movl	%eax, (%rdx)
	addl	$1, -52(%rbp)
.L6:
	cmpl	$799999999, -52(%rbp)
	jle	.L7
	movl	$.LC2, %edi
	call	puts
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-40(%rbp), %rax
	movl	$40000, %r9d
	movl	$30000, %r8d
	movl	$20000, %ecx
	movq	%rax, %rdi
	call	matrix_multiply
	call	clock
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC3(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC4, %edi
	movl	$1, %eax
	call	printf
	movl	$.LC5, %edi
	call	puts
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
.LC6:
	.string	"%f\t"
.LC7:
	.string	"%d \t %d\n"
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	-28(%rbp), %eax
	imull	-28(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L10
.L13:
	movl	-12(%rbp), %eax
	imull	-32(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.L11
.L12:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC6, %edi
	movl	$1, %eax
	call	printf
	addl	$1, -8(%rbp)
.L11:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	imull	-32(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.L12
	movl	$10, %edi
	call	putchar
	addl	$1, -12(%rbp)
.L10:
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L13
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	print_matrix, .-print_matrix
	.section	.rodata
.LC8:
	.string	"%d\t%d\tTime spent:  %f\n"
	.text
	.globl	matrix_multiply
	.type	matrix_multiply, @function
matrix_multiply:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movl	%ecx, -76(%rbp)
	movl	%r8d, -80(%rbp)
	movl	%r9d, -84(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L15
.L20:
	call	clock
	movq	%rax, -24(%rbp)
	movl	$0, -32(%rbp)
	jmp	.L16
.L19:
	movl	$0, -28(%rbp)
	jmp	.L17
.L18:
	movl	-36(%rbp), %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-32(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rax, %rdx
	movl	-36(%rbp), %eax
	imull	-84(%rbp), %eax
	movl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-72(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movl	-36(%rbp), %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm2
	movl	-28(%rbp), %eax
	imull	-84(%rbp), %eax
	movl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-64(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rdx)
	addl	$1, -28(%rbp)
.L17:
	movl	-28(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jl	.L18
	addl	$1, -32(%rbp)
.L16:
	movl	-32(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L19
	call	clock
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC3(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-76(%rbp), %edx
	movl	-36(%rbp), %ecx
	movq	%rax, -96(%rbp)
	movsd	-96(%rbp), %xmm0
	movl	%ecx, %esi
	movl	$.LC8, %edi
	movl	$1, %eax
	call	printf
	addl	$1, -36(%rbp)
.L15:
	movl	-36(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L20
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	matrix_multiply, .-matrix_multiply
	.globl	tiling_mm
	.type	tiling_mm, @function
tiling_mm:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -32(%rbp)
	movl	%r9d, -36(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	tiling_mm, .-tiling_mm
	.section	.rodata
	.align 4
.LC1:
	.long	0
	.align 8
.LC3:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
