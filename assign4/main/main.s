	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.section	__TEXT,__literal16,16byte_literals
	.align	4
LCPI0_0:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI0_1:
	.quad	4841369599423283200     ## double 4.503600e+15
	.quad	4985484787499139072     ## double 1.934281e+25
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI0_2:
	.quad	4696837146684686336     ## double 1.0E+6
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
Ltmp3:
	.cfi_offset %rbx, -56
Ltmp4:
	.cfi_offset %r12, -48
Ltmp5:
	.cfi_offset %r13, -40
Ltmp6:
	.cfi_offset %r14, -32
Ltmp7:
	.cfi_offset %r15, -24
	callq	_clock
	movq	%rax, %r14
	movl	$2400000000, %r12d      ## imm = 0x8F0D1800
	movl	$2400000000, %edi       ## imm = 0x8F0D1800
	callq	_malloc
	movq	%rax, %r15
	movabsq	$4800000000, %rdi       ## imm = 0x11E1A3000
	callq	_malloc
	movq	%rax, %r13
	addq	$800000000, %r12        ## imm = 0x2FAF0800
	movq	%r12, %rdi
	callq	_malloc
	movq	%rax, %r12
	leaq	L_.str(%rip), %rdi
	xorl	%ebx, %ebx
	movl	$4, %esi
	xorl	%eax, %eax
	callq	_printf
	.align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ebx, %xmm0
	movss	%xmm0, (%r15,%rbx,4)
	incq	%rbx
	cmpq	$600000000, %rbx        ## imm = 0x23C34600
	jne	LBB0_1
## BB#2:                                ## %.preheader2
	xorl	%eax, %eax
	.align	4, 0x90
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%eax, %xmm0
	movss	%xmm0, (%r13,%rax,4)
	incq	%rax
	cmpq	$1200000000, %rax       ## imm = 0x47868C00
	jne	LBB0_3
## BB#4:
	movl	$3200000000, %esi       ## imm = 0xBEBC2000
	movq	%r12, %rdi
	callq	___bzero
	leaq	L_str(%rip), %rdi
	callq	_puts
	movl	$20000, %ecx            ## imm = 0x4E20
	movl	$30000, %r8d            ## imm = 0x7530
	movl	$40000, %r9d            ## imm = 0x9C40
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	callq	_tiling_mm
	callq	_clock
	subq	%r14, %rax
	movd	%rax, %xmm0
	punpckldq	LCPI0_0(%rip), %xmm0 ## xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	subpd	LCPI0_1(%rip), %xmm0
	haddpd	%xmm0, %xmm0
	divsd	LCPI0_2(%rip), %xmm0
	leaq	L_.str2(%rip), %rdi
	movb	$1, %al
	callq	_printf
	leaq	L_str10(%rip), %rdi
	callq	_puts
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
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
Ltmp8:
	.cfi_def_cfa_offset 16
Ltmp9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp10:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
Ltmp11:
	.cfi_offset %rbx, -56
Ltmp12:
	.cfi_offset %r12, -48
Ltmp13:
	.cfi_offset %r13, -40
Ltmp14:
	.cfi_offset %r14, -32
Ltmp15:
	.cfi_offset %r15, -24
	movl	%r9d, -60(%rbp)         ## 4-byte Spill
	movl	%r8d, -76(%rbp)         ## 4-byte Spill
	movq	%rdx, %rbx
	movq	%rsi, %r12
	movq	%rdi, %r13
	testl	%ecx, %ecx
	jle	LBB1_11
## BB#1:                                ## %.preheader2.lr.ph
	movslq	%ecx, %rax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	imulq	$1374389535, %rax, %rax ## imm = 0x51EB851F
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$37, %rax
	addl	%ecx, %eax
	movslq	%r9d, %rcx
	imulq	$1374389535, %rcx, %rsi ## imm = 0x51EB851F
	movq	%rsi, %rdx
	shrq	$63, %rdx
	sarq	$37, %rsi
	addl	%edx, %esi
	imull	%eax, %esi
	movq	%rsi, -88(%rbp)         ## 8-byte Spill
	movslq	-76(%rbp), %r15         ## 4-byte Folded Reload
	leal	-1(%r15), %eax
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	imull	$100, %ecx, %eax
	movl	%eax, -108(%rbp)        ## 4-byte Spill
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	.align	4, 0x90
LBB1_2:                                 ## %.preheader2
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
                                        ##       Child Loop BB1_4 Depth 3
                                        ##         Child Loop BB1_5 Depth 4
                                        ##           Child Loop BB1_6 Depth 5
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	testl	%r9d, %r9d
                                        ## kill: EAX<def> EAX<kill> RAX<kill>
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	movl	$0, %eax
	jle	LBB1_10
	.align	4, 0x90
LBB1_3:                                 ## %.lr.ph
                                        ##   Parent Loop BB1_2 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_4 Depth 3
                                        ##         Child Loop BB1_5 Depth 4
                                        ##           Child Loop BB1_6 Depth 5
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	_clock
	movl	-60(%rbp), %r11d        ## 4-byte Reload
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	cmpl	$0, -76(%rbp)           ## 4-byte Folded Reload
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movl	%eax, %r8d
	movl	$0, %r9d
	jle	LBB1_9
	.align	4, 0x90
LBB1_4:                                 ## %.preheader1
                                        ##   Parent Loop BB1_2 Depth=1
                                        ##     Parent Loop BB1_3 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB1_5 Depth 4
                                        ##           Child Loop BB1_6 Depth 5
	movl	-44(%rbp), %r10d        ## 4-byte Reload
	xorl	%esi, %esi
	.align	4, 0x90
LBB1_5:                                 ## %.preheader
                                        ##   Parent Loop BB1_2 Depth=1
                                        ##     Parent Loop BB1_3 Depth=2
                                        ##       Parent Loop BB1_4 Depth=3
                                        ## =>      This Loop Header: Depth=4
                                        ##           Child Loop BB1_6 Depth 5
	leaq	(%rsi,%r14), %rdi
	imulq	%r15, %rdi
	addq	%r9, %rdi
	movl	$100, %eax
	movl	%r10d, %ecx
	movl	%r8d, %edx
	.align	4, 0x90
LBB1_6:                                 ##   Parent Loop BB1_2 Depth=1
                                        ##     Parent Loop BB1_3 Depth=2
                                        ##       Parent Loop BB1_4 Depth=3
                                        ##         Parent Loop BB1_5 Depth=4
                                        ## =>        This Inner Loop Header: Depth=5
	movss	(%r13,%rdi,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	movslq	%edx, %rdx
	mulss	(%r12,%rdx,4), %xmm0
	movslq	%ecx, %rcx
	addss	(%rbx,%rcx,4), %xmm0
	movss	%xmm0, (%rbx,%rcx,4)
	incl	%edx
	incl	%ecx
	decq	%rax
	jne	LBB1_6
## BB#7:                                ##   in Loop: Header=BB1_5 Depth=4
	incq	%rsi
	addl	%r11d, %r10d
	cmpq	$100, %rsi
	jne	LBB1_5
## BB#8:                                ##   in Loop: Header=BB1_4 Depth=3
	addl	%r11d, %r8d
	cmpl	-48(%rbp), %r9d         ## 4-byte Folded Reload
	leaq	1(%r9), %r9
	jne	LBB1_4
LBB1_9:                                 ## %._crit_edge
                                        ##   in Loop: Header=BB1_3 Depth=2
	callq	_clock
	subq	-72(%rbp), %rax         ## 8-byte Folded Reload
	movd	%rax, %xmm0
	punpckldq	LCPI1_0(%rip), %xmm0 ## xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	subpd	LCPI1_1(%rip), %xmm0
	haddpd	%xmm0, %xmm0
	divsd	LCPI1_2(%rip), %xmm0
	movb	$1, %al
	leaq	L_.str8(%rip), %rdi
	movl	%r14d, %esi
	movq	-56(%rbp), %rdx         ## 8-byte Reload
                                        ## kill: EDX<def> EDX<kill> RDX<kill>
	movq	-88(%rbp), %rcx         ## 8-byte Reload
                                        ## kill: ECX<def> ECX<kill> RCX<kill>
	callq	_printf
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movl	-60(%rbp), %r9d         ## 4-byte Reload
	addl	$100, %eax
	addl	$100, -44(%rbp)         ## 4-byte Folded Spill
	cmpl	%r9d, %eax
	jl	LBB1_3
LBB1_10:                                ## %._crit_edge8
                                        ##   in Loop: Header=BB1_2 Depth=1
	addq	$100, %r14
	movq	-96(%rbp), %rax         ## 8-byte Reload
	addl	-108(%rbp), %eax        ## 4-byte Folded Reload
	cmpq	-104(%rbp), %r14        ## 8-byte Folded Reload
	jl	LBB1_2
LBB1_11:                                ## %._crit_edge11
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
Ltmp16:
	.cfi_def_cfa_offset 16
Ltmp17:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp18:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
Ltmp19:
	.cfi_offset %rbx, -56
Ltmp20:
	.cfi_offset %r12, -48
Ltmp21:
	.cfi_offset %r13, -40
Ltmp22:
	.cfi_offset %r14, -32
Ltmp23:
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
	leaq	L_.str4(%rip), %r12
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
	leaq	L_.str6(%rip), %rdi
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

	.section	__TEXT,__literal16,16byte_literals
	.align	4
LCPI3_0:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI3_1:
	.quad	4841369599423283200     ## double 4.503600e+15
	.quad	4985484787499139072     ## double 1.934281e+25
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI3_2:
	.quad	4696837146684686336     ## double 1.0E+6
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_matrix_multiply
	.align	4, 0x90
_matrix_multiply:                       ## @matrix_multiply
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp24:
	.cfi_def_cfa_offset 16
Ltmp25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp26:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
Ltmp27:
	.cfi_offset %rbx, -56
Ltmp28:
	.cfi_offset %r12, -48
Ltmp29:
	.cfi_offset %r13, -40
Ltmp30:
	.cfi_offset %r14, -32
Ltmp31:
	.cfi_offset %r15, -24
                                        ## kill: R9D<def> R9D<kill> R9<def>
	movl	%r8d, %r12d
                                        ## kill: ECX<def> ECX<kill> RCX<def>
	movq	%rcx, -64(%rbp)         ## 8-byte Spill
	movq	%rdx, %rbx
	movq	%rsi, -96(%rbp)         ## 8-byte Spill
	movq	%rdi, %r13
	testl	%ecx, %ecx
	jle	LBB3_9
## BB#1:                                ## %.lr.ph7
	movq	%r9, -72(%rbp)          ## 8-byte Spill
	leal	-1(%r9), %r15d
	movslq	%r9d, %rcx
	movq	%rcx, -104(%rbp)        ## 8-byte Spill
	movq	-64(%rbp), %rax         ## 8-byte Reload
	leal	-1(%rax), %eax
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	movslq	%r12d, %rax
	shlq	$2, %rax
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	leaq	(,%rcx,4), %r14
	xorl	%eax, %eax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	.align	4, 0x90
LBB3_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_4 Depth 2
                                        ##       Child Loop BB3_6 Depth 3
	callq	_clock
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	-72(%rbp), %rax         ## 8-byte Reload
	testl	%eax, %eax
	jle	LBB3_8
## BB#3:                                ## %.preheader.lr.ph
                                        ##   in Loop: Header=BB3_2 Depth=1
	movq	-48(%rbp), %r8          ## 8-byte Reload
	imulq	-104(%rbp), %r8         ## 8-byte Folded Reload
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	xorl	%r9d, %r9d
	.align	4, 0x90
LBB3_4:                                 ## %.preheader
                                        ##   Parent Loop BB3_2 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB3_6 Depth 3
	testl	%r12d, %r12d
	jle	LBB3_7
## BB#5:                                ## %.lr.ph
                                        ##   in Loop: Header=BB3_4 Depth=2
	leaq	(%r9,%r8), %rsi
	movq	%rcx, %rdi
	movq	%r13, %rax
	movl	%r12d, %edx
	.align	4, 0x90
LBB3_6:                                 ##   Parent Loop BB3_2 Depth=1
                                        ##     Parent Loop BB3_4 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movss	(%rax), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	mulss	(%rdi), %xmm0
	addss	(%rbx,%rsi,4), %xmm0
	movss	%xmm0, (%rbx,%rsi,4)
	addq	$4, %rax
	addq	%r14, %rdi
	decl	%edx
	jne	LBB3_6
LBB3_7:                                 ## %._crit_edge
                                        ##   in Loop: Header=BB3_4 Depth=2
	addq	$4, %rcx
	cmpl	%r15d, %r9d
	leaq	1(%r9), %r9
	jne	LBB3_4
LBB3_8:                                 ## %._crit_edge4
                                        ##   in Loop: Header=BB3_2 Depth=1
	callq	_clock
	subq	-56(%rbp), %rax         ## 8-byte Folded Reload
	movd	%rax, %xmm0
	punpckldq	LCPI3_0(%rip), %xmm0 ## xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	subpd	LCPI3_1(%rip), %xmm0
	haddpd	%xmm0, %xmm0
	divsd	LCPI3_2(%rip), %xmm0
	movb	$1, %al
	leaq	L_.str7(%rip), %rdi
	movq	-48(%rbp), %rsi         ## 8-byte Reload
                                        ## kill: ESI<def> ESI<kill> RSI<kill>
	movq	-64(%rbp), %rdx         ## 8-byte Reload
                                        ## kill: EDX<def> EDX<kill> RDX<kill>
	callq	_printf
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, %rax
	incq	%rax
	addq	-88(%rbp), %r13         ## 8-byte Folded Reload
	cmpl	-76(%rbp), %ecx         ## 4-byte Folded Reload
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	jne	LBB3_2
LBB3_9:                                 ## %._crit_edge8
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_sync_mm
	.align	4, 0x90
_sync_mm:                               ## @sync_mm
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp32:
	.cfi_def_cfa_offset 16
Ltmp33:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp34:
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_verification
	.align	4, 0x90
_verification:                          ## @verification
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp35:
	.cfi_def_cfa_offset 16
Ltmp36:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp37:
	.cfi_def_cfa_register %rbp
	leaq	L_str11(%rip), %rdi
	popq	%rbp
	jmp	_puts                   ## TAILCALL
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d\n"

L_.str1:                                ## @.str1
	.asciz	"Starting everything!!!\n"

L_.str2:                                ## @.str2
	.asciz	"time spent: %f \n"

L_.str3:                                ## @.str3
	.asciz	"Seems good! \n"

L_.str4:                                ## @.str4
	.asciz	"%f\t"

L_.str5:                                ## @.str5
	.asciz	"\n"

L_.str6:                                ## @.str6
	.asciz	"%d \t %d\n"

L_.str7:                                ## @.str7
	.asciz	"%d\t%d\tTime spent:  %f\n"

L_.str8:                                ## @.str8
	.asciz	"%d\t%d\t%d\tTime Spent:  %f\n"

L_.str9:                                ## @.str9
	.asciz	"The result is, however, right!\n"

	.align	4                       ## @str
L_str:
	.asciz	"Starting everything!!!"

L_str10:                                ## @str10
	.asciz	"Seems good! "

	.align	4                       ## @str11
L_str11:
	.asciz	"The result is, however, right!"


.subsections_via_symbols
