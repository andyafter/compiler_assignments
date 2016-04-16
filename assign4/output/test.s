	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI0_0:
	.quad	4696837146684686336     ## double 1.0E+6
	.section	__TEXT,__literal16,16byte_literals
	.align	4
LCPI0_1:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI0_2:
	.quad	4841369599423283200     ## double 4.503600e+15
	.quad	4985484787499139072     ## double 1.934281e+25
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movl	$0, -4(%rbp)
	callq	_clock
	movl	$240000000, %ecx        ## imm = 0xE4E1C00
	movl	%ecx, %edi
	movq	%rax, -48(%rbp)
	callq	_malloc
	movl	$480000000, %ecx        ## imm = 0x1C9C3800
	movl	%ecx, %edi
	movq	%rax, -16(%rbp)
	callq	_malloc
	movl	$3200000000, %ecx       ## imm = 0xBEBC2000
	movl	%ecx, %edi
	movq	%rax, -24(%rbp)
	callq	_malloc
	leaq	L_.str(%rip), %rdi
	movl	$4, %ecx
	movl	%ecx, %esi
	movq	%rax, -32(%rbp)
	movb	$0, %al
	callq	_printf
	movl	$0, -36(%rbp)
	movl	%eax, -68(%rbp)         ## 4-byte Spill
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$60000000, -36(%rbp)    ## imm = 0x3938700
	jge	LBB0_4
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	cvtsi2ssl	-36(%rbp), %xmm0
	movslq	-36(%rbp), %rax
	movq	-16(%rbp), %rcx
	movss	%xmm0, (%rcx,%rax,4)
## BB#3:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB0_1
LBB0_4:
	movl	$0, -36(%rbp)
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$120000000, -36(%rbp)   ## imm = 0x7270E00
	jge	LBB0_8
## BB#6:                                ##   in Loop: Header=BB0_5 Depth=1
	cvtsi2ssl	-36(%rbp), %xmm0
	movslq	-36(%rbp), %rax
	movq	-24(%rbp), %rcx
	movss	%xmm0, (%rcx,%rax,4)
## BB#7:                                ##   in Loop: Header=BB0_5 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB0_5
LBB0_8:
	movl	$0, -36(%rbp)
LBB0_9:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$800000000, -36(%rbp)   ## imm = 0x2FAF0800
	jge	LBB0_12
## BB#10:                               ##   in Loop: Header=BB0_9 Depth=1
	xorps	%xmm0, %xmm0
	movslq	-36(%rbp), %rax
	movq	-32(%rbp), %rcx
	movss	%xmm0, (%rcx,%rax,4)
## BB#11:                               ##   in Loop: Header=BB0_9 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB0_9
LBB0_12:
	leaq	L_.str1(%rip), %rdi
	movsd	LCPI0_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rsi
	movq	-32(%rbp), %rdx
	movl	$20000, %ecx            ## imm = 0x4E20
	movl	$3000, %r8d             ## imm = 0xBB8
	movl	$40000, %r9d            ## imm = 0x9C40
	movq	%rdi, -80(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movsd	%xmm0, -88(%rbp)        ## 8-byte Spill
	callq	_tiling_mm
	callq	_clock
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rdx
	subq	%rdx, %rax
	movd	%rax, %xmm0
	movaps	LCPI0_1(%rip), %xmm1    ## xmm1 = [1127219200,1160773632,0,0]
	punpckldq	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movapd	LCPI0_2(%rip), %xmm1    ## xmm1 = [4.503600e+15,1.934281e+25]
	subpd	%xmm1, %xmm0
	haddpd	%xmm0, %xmm0
	movsd	-88(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	-64(%rbp), %xmm0        ## xmm0 = mem[0],zero
	movq	-80(%rbp), %rdi         ## 8-byte Reload
	movb	$1, %al
	callq	_printf
	xorl	%ecx, %ecx
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	addq	$96, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI1_0:
	.quad	4696837146684686336     ## double 1.0E+6
	.section	__TEXT,__literal16,16byte_literals
	.align	4
LCPI1_1:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI1_2:
	.quad	4841369599423283200     ## double 4.503600e+15
	.quad	4985484787499139072     ## double 1.934281e+25
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_tiling_mm
	.align	4, 0x90
_tiling_mm:                             ## @tiling_mm
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movl	$80, %eax
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -32(%rbp)
	movl	%r9d, -36(%rbp)
	movl	-28(%rbp), %ecx
	movl	%eax, -88(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	cltd
	movl	-88(%rbp), %ecx         ## 4-byte Reload
	idivl	%ecx
	movl	-36(%rbp), %r8d
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	movl	%r8d, %eax
	cltd
	idivl	%ecx
	movl	-92(%rbp), %r8d         ## 4-byte Reload
	imull	%eax, %r8d
	movl	%r8d, -84(%rbp)
	movl	$0, -40(%rbp)
LBB1_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
                                        ##       Child Loop BB1_5 Depth 3
                                        ##         Child Loop BB1_7 Depth 4
                                        ##           Child Loop BB1_9 Depth 5
	movl	-40(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	LBB1_20
## BB#2:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	$0, -56(%rbp)
LBB1_3:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_5 Depth 3
                                        ##         Child Loop BB1_7 Depth 4
                                        ##           Child Loop BB1_9 Depth 5
	movl	-56(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	LBB1_18
## BB#4:                                ##   in Loop: Header=BB1_3 Depth=2
	callq	_clock
	movq	%rax, -72(%rbp)
	movl	$0, -44(%rbp)
LBB1_5:                                 ##   Parent Loop BB1_1 Depth=1
                                        ##     Parent Loop BB1_3 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB1_7 Depth 4
                                        ##           Child Loop BB1_9 Depth 5
	movl	-44(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jge	LBB1_16
## BB#6:                                ##   in Loop: Header=BB1_5 Depth=3
	movl	$0, -48(%rbp)
LBB1_7:                                 ##   Parent Loop BB1_1 Depth=1
                                        ##     Parent Loop BB1_3 Depth=2
                                        ##       Parent Loop BB1_5 Depth=3
                                        ## =>      This Loop Header: Depth=4
                                        ##           Child Loop BB1_9 Depth 5
	cmpl	$80, -48(%rbp)
	jge	LBB1_14
## BB#8:                                ##   in Loop: Header=BB1_7 Depth=4
	movl	$0, -52(%rbp)
LBB1_9:                                 ##   Parent Loop BB1_1 Depth=1
                                        ##     Parent Loop BB1_3 Depth=2
                                        ##       Parent Loop BB1_5 Depth=3
                                        ##         Parent Loop BB1_7 Depth=4
                                        ## =>        This Inner Loop Header: Depth=5
	cmpl	$80, -52(%rbp)
	jge	LBB1_12
## BB#10:                               ##   in Loop: Header=BB1_9 Depth=5
	movl	-40(%rbp), %eax
	imull	-32(%rbp), %eax
	movl	-48(%rbp), %ecx
	imull	-32(%rbp), %ecx
	addl	%ecx, %eax
	addl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rsi
	movss	(%rsi,%rdx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	movl	-52(%rbp), %eax
	addl	-56(%rbp), %eax
	movl	-44(%rbp), %ecx
	imull	-36(%rbp), %ecx
	addl	%ecx, %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rsi
	mulss	(%rsi,%rdx,4), %xmm0
	movl	-40(%rbp), %eax
	imull	-36(%rbp), %eax
	movl	-48(%rbp), %ecx
	imull	-36(%rbp), %ecx
	addl	%ecx, %eax
	addl	-52(%rbp), %eax
	addl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rsi
	addss	(%rsi,%rdx,4), %xmm0
	movss	%xmm0, (%rsi,%rdx,4)
## BB#11:                               ##   in Loop: Header=BB1_9 Depth=5
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	LBB1_9
LBB1_12:                                ##   in Loop: Header=BB1_7 Depth=4
	jmp	LBB1_13
LBB1_13:                                ##   in Loop: Header=BB1_7 Depth=4
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	jmp	LBB1_7
LBB1_14:                                ##   in Loop: Header=BB1_5 Depth=3
	jmp	LBB1_15
LBB1_15:                                ##   in Loop: Header=BB1_5 Depth=3
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	LBB1_5
LBB1_16:                                ##   in Loop: Header=BB1_3 Depth=2
	leaq	L_.str5(%rip), %rdi
	movsd	LCPI1_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	%rdi, -104(%rbp)        ## 8-byte Spill
	movsd	%xmm0, -112(%rbp)       ## 8-byte Spill
	callq	_clock
	movq	%rax, -80(%rbp)
	movq	-72(%rbp), %rdi
	subq	%rdi, %rax
	movd	%rax, %xmm0
	movaps	LCPI1_1(%rip), %xmm1    ## xmm1 = [1127219200,1160773632,0,0]
	punpckldq	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movapd	LCPI1_2(%rip), %xmm1    ## xmm1 = [4.503600e+15,1.934281e+25]
	subpd	%xmm1, %xmm0
	haddpd	%xmm0, %xmm0
	movsd	-112(%rbp), %xmm1       ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	movl	-40(%rbp), %esi
	movl	-56(%rbp), %edx
	movl	-84(%rbp), %ecx
	movsd	-64(%rbp), %xmm0        ## xmm0 = mem[0],zero
	movq	-104(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_printf
	movl	%eax, -116(%rbp)        ## 4-byte Spill
## BB#17:                               ##   in Loop: Header=BB1_3 Depth=2
	movl	-56(%rbp), %eax
	addl	$80, %eax
	movl	%eax, -56(%rbp)
	jmp	LBB1_3
LBB1_18:                                ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_19
LBB1_19:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	-40(%rbp), %eax
	addl	$80, %eax
	movl	%eax, -40(%rbp)
	jmp	LBB1_1
LBB1_20:
	addq	$128, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_print_matrix
	.align	4, 0x90
_print_matrix:                          ## @print_matrix
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-12(%rbp), %edx
	imull	-12(%rbp), %edx
	movl	%edx, -28(%rbp)
	movl	$0, -20(%rbp)
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	LBB2_8
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-20(%rbp), %eax
	imull	-16(%rbp), %eax
	movl	%eax, -24(%rbp)
LBB2_3:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-24(%rbp), %eax
	movl	-20(%rbp), %ecx
	imull	-16(%rbp), %ecx
	addl	-16(%rbp), %ecx
	cmpl	%ecx, %eax
	jge	LBB2_6
## BB#4:                                ##   in Loop: Header=BB2_3 Depth=2
	leaq	L_.str2(%rip), %rdi
	movslq	-24(%rbp), %rax
	movq	-8(%rbp), %rcx
	cvtss2sd	(%rcx,%rax,4), %xmm0
	movb	$1, %al
	callq	_printf
	movl	%eax, -32(%rbp)         ## 4-byte Spill
## BB#5:                                ##   in Loop: Header=BB2_3 Depth=2
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB2_3
LBB2_6:                                 ##   in Loop: Header=BB2_1 Depth=1
	leaq	L_.str3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -36(%rbp)         ## 4-byte Spill
## BB#7:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB2_1
LBB2_8:
	leaq	L_.str4(%rip), %rdi
	movl	-12(%rbp), %esi
	movl	-16(%rbp), %edx
	movb	$0, %al
	callq	_printf
	movl	%eax, -40(%rbp)         ## 4-byte Spill
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d\n"

L_.str1:                                ## @.str1
	.asciz	"time spent: %f \n"

L_.str2:                                ## @.str2
	.asciz	"%f\t"

L_.str3:                                ## @.str3
	.asciz	"\n"

L_.str4:                                ## @.str4
	.asciz	"%d \t %d\n"

L_.str5:                                ## @.str5
	.asciz	"%d\t%d\t%d\tTime Spent:  %f\n"


.subsections_via_symbols
