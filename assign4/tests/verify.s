	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
Ltmp3:
	.cfi_offset %rbx, -40
Ltmp4:
	.cfi_offset %r14, -32
Ltmp5:
	.cfi_offset %r15, -24
	movl	$64, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	$128, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$128, %edi
	callq	_malloc
	movq	%rax, %r15
	xorl	%eax, %eax
	.align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	%xmm0, (%r14,%rax,4)
	incq	%rax
	cmpq	$16, %rax
	jne	LBB0_1
## BB#2:                                ## %.preheader1
	xorl	%eax, %eax
	.align	4, 0x90
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	%xmm0, (%rbx,%rax,4)
	incq	%rax
	cmpq	$32, %rax
	jne	LBB0_3
## BB#4:
	movq	$0, 120(%r15)
	movq	$0, 112(%r15)
	movq	$0, 104(%r15)
	movq	$0, 96(%r15)
	movq	$0, 88(%r15)
	movq	$0, 80(%r15)
	movq	$0, 72(%r15)
	movq	$0, 64(%r15)
	movq	$0, 56(%r15)
	movq	$0, 48(%r15)
	movq	$0, 40(%r15)
	movq	$0, 32(%r15)
	movq	$0, 24(%r15)
	movq	$0, 16(%r15)
	movq	$0, 8(%r15)
	movq	$0, (%r15)
	movl	$4, %ecx
	movl	$4, %r8d
	movl	$8, %r9d
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_tiling_mm
	movl	$4, %esi
	movl	$4, %edx
	movq	%r14, %rdi
	callq	_print_matrix
	movl	$4, %esi
	movl	$8, %edx
	movq	%rbx, %rdi
	callq	_print_matrix
	movl	$4, %esi
	movl	$8, %edx
	movq	%r15, %rdi
	callq	_print_matrix
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__literal16,16byte_literals
	.align	4
LCPI1_0:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI1_1:
	.quad	4841369599423283200     ## double 4.503600e+15
	.quad	4985484787499139072     ## double 1.934281e+25
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI1_2:
	.quad	4696837146684686336     ## double 1.0E+6
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_tiling_mm
	.align	4, 0x90
_tiling_mm:                             ## @tiling_mm
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
Ltmp9:
	.cfi_offset %rbx, -56
Ltmp10:
	.cfi_offset %r12, -48
Ltmp11:
	.cfi_offset %r13, -40
Ltmp12:
	.cfi_offset %r14, -32
Ltmp13:
	.cfi_offset %r15, -24
                                        ## kill: R9D<def> R9D<kill> R9<def>
	movq	%r9, -48(%rbp)          ## 8-byte Spill
	movl	%r8d, -68(%rbp)         ## 4-byte Spill
	movl	%ecx, -92(%rbp)         ## 4-byte Spill
	movq	%rdx, %rbx
	movq	%rsi, %r13
	movq	%rdi, %r15
	testl	%ecx, %ecx
	jle	LBB1_11
## BB#1:                                ## %.lr.ph
	movslq	-68(%rbp), %r12         ## 4-byte Folded Reload
	leal	-1(%r12), %eax
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	movslq	-92(%rbp), %rax         ## 4-byte Folded Reload
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	movq	-48(%rbp), %rax         ## 8-byte Reload
	leal	(%rax,%rax), %eax
	movl	%eax, -108(%rbp)        ## 4-byte Spill
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	.align	4, 0x90
LBB1_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
                                        ##       Child Loop BB1_4 Depth 3
                                        ##         Child Loop BB1_5 Depth 4
                                        ##           Child Loop BB1_6 Depth 5
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	callq	_clock
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	movq	-48(%rbp), %rax         ## 8-byte Reload
	testl	%eax, %eax
	movq	-80(%rbp), %rax         ## 8-byte Reload
	movl	%eax, %r9d
	movl	$0, %ecx
	jle	LBB1_10
	.align	4, 0x90
LBB1_3:                                 ## %.preheader2
                                        ##   Parent Loop BB1_2 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_4 Depth 3
                                        ##         Child Loop BB1_5 Depth 4
                                        ##           Child Loop BB1_6 Depth 5
	movq	%rcx, -64(%rbp)         ## 8-byte Spill
	cmpl	$0, -68(%rbp)           ## 4-byte Folded Reload
	movl	%ecx, %r10d
	movl	$0, %r11d
	jle	LBB1_9
	.align	4, 0x90
LBB1_4:                                 ## %.preheader1
                                        ##   Parent Loop BB1_2 Depth=1
                                        ##     Parent Loop BB1_3 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB1_5 Depth 4
                                        ##           Child Loop BB1_6 Depth 5
	movl	%r9d, %edi
	xorl	%ecx, %ecx
	.align	4, 0x90
LBB1_5:                                 ## %.preheader
                                        ##   Parent Loop BB1_2 Depth=1
                                        ##     Parent Loop BB1_3 Depth=2
                                        ##       Parent Loop BB1_4 Depth=3
                                        ## =>      This Loop Header: Depth=4
                                        ##           Child Loop BB1_6 Depth 5
	leaq	(%rcx,%r14), %rax
	imulq	%r12, %rax
	addq	%r11, %rax
	movl	$2, %edx
	movl	%edi, %esi
	movl	%r10d, %r8d
	.align	4, 0x90
LBB1_6:                                 ##   Parent Loop BB1_2 Depth=1
                                        ##     Parent Loop BB1_3 Depth=2
                                        ##       Parent Loop BB1_4 Depth=3
                                        ##         Parent Loop BB1_5 Depth=4
                                        ## =>        This Inner Loop Header: Depth=5
	movss	(%r15,%rax,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	movslq	%r8d, %r8
	mulss	(%r13,%r8,4), %xmm0
	movslq	%esi, %rsi
	addss	(%rbx,%rsi,4), %xmm0
	movss	%xmm0, (%rbx,%rsi,4)
	incl	%r8d
	incl	%esi
	decq	%rdx
	jne	LBB1_6
## BB#7:                                ##   in Loop: Header=BB1_5 Depth=4
	incq	%rcx
	movq	-48(%rbp), %rax         ## 8-byte Reload
	addl	%eax, %edi
	cmpq	$2, %rcx
	jne	LBB1_5
## BB#8:                                ##   in Loop: Header=BB1_4 Depth=3
	movq	-48(%rbp), %rax         ## 8-byte Reload
	addl	%eax, %r10d
	cmpl	-52(%rbp), %r11d        ## 4-byte Folded Reload
	leaq	1(%r11), %r11
	jne	LBB1_4
LBB1_9:                                 ## %._crit_edge
                                        ##   in Loop: Header=BB1_3 Depth=2
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	addl	$2, %ecx
	addl	$2, %r9d
	movq	-48(%rbp), %rax         ## 8-byte Reload
	cmpl	%eax, %ecx
	jl	LBB1_3
LBB1_10:                                ## %._crit_edge8
                                        ##   in Loop: Header=BB1_2 Depth=1
	callq	_clock
	subq	-88(%rbp), %rax         ## 8-byte Folded Reload
	movd	%rax, %xmm0
	punpckldq	LCPI1_0(%rip), %xmm0 ## xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	subpd	LCPI1_1(%rip), %xmm0
	haddpd	%xmm0, %xmm0
	divsd	LCPI1_2(%rip), %xmm0
	movb	$1, %al
	leaq	L_.str3(%rip), %rdi
	movl	%r14d, %esi
	movl	-92(%rbp), %edx         ## 4-byte Reload
	callq	_printf
	addq	$2, %r14
	movq	-80(%rbp), %rax         ## 8-byte Reload
	addl	-108(%rbp), %eax        ## 4-byte Folded Reload
	cmpq	-104(%rbp), %r14        ## 8-byte Folded Reload
	jl	LBB1_2
LBB1_11:                                ## %._crit_edge12
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_print_matrix
	.align	4, 0x90
_print_matrix:                          ## @print_matrix
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp14:
	.cfi_def_cfa_offset 16
Ltmp15:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp16:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
Ltmp17:
	.cfi_offset %rbx, -56
Ltmp18:
	.cfi_offset %r12, -48
Ltmp19:
	.cfi_offset %r13, -40
Ltmp20:
	.cfi_offset %r14, -32
Ltmp21:
	.cfi_offset %r15, -24
	movl	%edx, -52(%rbp)         ## 4-byte Spill
                                        ## kill: ESI<def> ESI<kill> RSI<def>
	movq	%rsi, -64(%rbp)         ## 8-byte Spill
	movq	%rdi, %rbx
	testl	%esi, %esi
	jle	LBB2_6
## BB#1:                                ## %.lr.ph4
	movq	-64(%rbp), %rax         ## 8-byte Reload
	leal	-1(%rax), %eax
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	xorl	%r14d, %r14d
	leaq	L_.str(%rip), %r12
	xorl	%eax, %eax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	.align	4, 0x90
LBB2_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_4 Depth 2
	testl	%edx, %edx
	jle	LBB2_5
## BB#3:                                ## %.lr.ph
                                        ##   in Loop: Header=BB2_2 Depth=1
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movl	%eax, %r15d
	movl	-52(%rbp), %eax         ## 4-byte Reload
	imull	%eax, %r15d
	addl	%eax, %r15d
	movslq	%r14d, %r13
	.align	4, 0x90
LBB2_4:                                 ##   Parent Loop BB2_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movss	(%rbx,%r13,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movb	$1, %al
	movq	%r12, %rdi
	callq	_printf
	incq	%r13
	cmpl	%r15d, %r13d
	jl	LBB2_4
LBB2_5:                                 ## %._crit_edge
                                        ##   in Loop: Header=BB2_2 Depth=1
	movl	$10, %edi
	callq	_putchar
	movl	-52(%rbp), %edx         ## 4-byte Reload
	addl	%edx, %r14d
	movq	-48(%rbp), %rax         ## 8-byte Reload
	cmpl	-56(%rbp), %eax         ## 4-byte Folded Reload
	leal	1(%rax), %eax
                                        ## kill: EAX<def> EAX<kill> RAX<def>
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	jne	LBB2_2
LBB2_6:                                 ## %._crit_edge5
	leaq	L_.str2(%rip), %rdi
	xorl	%eax, %eax
	movq	-64(%rbp), %rsi         ## 8-byte Reload
                                        ## kill: ESI<def> ESI<kill> RSI<kill>
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_printf                 ## TAILCALL
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%f\t"

L_.str1:                                ## @.str1
	.asciz	"\n"

L_.str2:                                ## @.str2
	.asciz	"%d \t %d\n"

L_.str3:                                ## @.str3
	.asciz	"%d\t%d\tTime Spent:  %f\n"


.subsections_via_symbols
