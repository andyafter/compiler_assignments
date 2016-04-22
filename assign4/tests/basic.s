	.section	.rodata
.LC2:
	.string	"time spent: %d \n"
	.text
	.globl	main
	.type	main, @function
.LC6:   
        .string	"One Round Clock Time: \t%f\n"
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
        movq    $1,  %rsi
	movq    $.LC2, %rdi
	call    printf
        call    clock
        movq    %rax, -48(%rbp)   #here X,Y,Z is 2, 3, 4
        movl	$24000000, %edi         #allocation of a
        call	malloc
        movq    %rax, -40(%rbp)
        movl	$48000000, %edi         
        call	malloc            #allocation of b
        movq    %rax, -32(%rbp)
        movl	$32000000, %edi         
        call	malloc            #allocation of c
        movq    %rax, -24(%rbp)         #storing c to stack
        movq    $0, %rbx

# will pack it up if have time        
.ADDVALUEC:                     #at first rax carries the value of c 
        addq    $1, %rbx
        cvtsi2ss %rbx, %xmm0       # put the value directly into the array
        movss   %xmm0, (%rax,%rbx,4)
        cmpl    $8000000, %ebx       # change 32 to size of c
	jl      .ADDVALUEC
        movq    $0, %rbx
.ADDVALUEB:                     #at first rax carries the value of c
        movq    -32(%rbp), %rax
	addq    $1, %rbx
	cvtsi2ss %rbx, %xmm0   
	movss   %xmm0, (%rax,%rbx,4)
	cmpl    $12000000, %ebx       
	jl      .ADDVALUEB
        movq    $0, %rbx
.ADDVALUEA:                     
	movq    -40(%rbp), %rax
        addq    $1, %rbx
	cvtsi2ss %rbx, %xmm0       
	movss   %xmm0, (%rax,%rbx,4)
	cmpl    $6000000, %ebx       
	jl      .ADDVALUEA

        call    clock
	movq    %rax, -48(%rbp)

	movq    %rax, %rsi
	movq    $.LC7, %rdi
	call    printf
        

        movl    $0, %r12d       # loop for a
        movl    $0, %r10d      # loop for b
.MULTIPLY:
        movq    -40(%rbp), %rdi
        movq    -32(%rbp), %rsi
        addq    %r10,   %rsi
        movq    -24(%rbp), %rdx
        addq    %r9,   %rdi

        movl    $2000, %ecx    
        movl    $3000, %r8d    
        movl    $4000, %r9d
        call    test_fun           # test_fun is to multiply one
        movq    -24(%rbp), %rcx
        movq    %r12, %rbx
        movss   %xmm3, (%rcx, %rbx, 4)
        movq    -24(%rbp), %rax
        movq    $0, %rbx

        addl    $8000,   %r12d
        movl    $800000, %ebx  # 8000*100, the block size
        cmpl    %ebx,    %r12d
        jl      .MULTIPLY
        jge     .RAWB

.RAWB:
	movq    -48(%rbp), %rbx
        call    clock
	subq    %rbx, %rax
	movq    %rax, %rsi
	movq    $.LC7, %rdi
	call    printf
        
        movl    $800000, %ebx
        addq    $8000,  %r10
        movq    $0,     %r12
        cmpl    %ebx, %r10d
        jle     .MULTIPLY
        
        

        call    clock
        movq    -48(%rbp), %rbx
        subq    %rbx, %rax
        movq    %rax, %rsi
        movq    $.LC7, %rdi
        call    printf
        
        
        # test alignment!!
	#movaps  (%rax,%rbx,4), %xmm0
	#addps   %xmm0, %xmm0
        #movss  %xmm3, (%rax, %rbx, 4)

	movq    -24(%rbp), %rdi         
        movl    $2, %esi                
	movl    $4, %edx
	call    print_matrix 


        # returning
        movl    $0, %eax
        leave
        .cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata

.LC7:
	.string	"new function, %d\n"
	.text
	.globl	test_fun
	.type	test_fun, @function        
test_fun:       # this function is only for single value of c
.LFB5:
        .cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
        subq	$80, %rsp
        movq    %rdi, -40(%rbp)
	movq    %rsi, -32(%rbp)
	movq    %rdx, -24(%rbp)
        movq    %rcx, -52(%rbp)         #x
        movq    %rcx, %r8               #x
        
        movq    -24(%rbp), %rcx         #rcx is c
        movq    -32(%rbp), %rbx         #rbx is b
        movq    -40(%rbp), %rax         #rax is a
        movq    $0, %rdx
        xorps   %xmm3,  %xmm3
        movq    $200000, %r8
        jmp     .MYMUL
.MYMUL:                                 # sum is in %imm3, but only to see the time
        addq    $4,    %rdx
	movaps  (%rax, %rdx,4), %xmm0
	movaps  (%rcx, %rdx,4), %xmm1
	mulps   %xmm1, %xmm0
        # here add them all to %xmm3
        addss   %xmm0, %xmm3
        shufps  $0x39,   %xmm0, %xmm0
        addss   %xmm0, %xmm3
	shufps  $0x39,   %xmm0, %xmm0
        addss   %xmm0, %xmm3
	shufps  $0x39,   %xmm0, %xmm0
	addss   %xmm0, %xmm3
        cmpl    %r8d,  %edx
        jle     .MYMUL
        

        movq    $0, %rax  
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	test_fun, .-test_fun
	.section	.rodata

.LC3:
	.string	"%f\t"
.LC4:
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
	movl	$.LC3, %edi
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
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	print_matrix, .-print_matrix
	.section	.rodata
.LC5:
	.string	"%d\t%d\t%d\tTime Spent:  %f\n"
	.text
	.globl	tiling_mm
	.type	tiling_mm, @function
tiling_mm:
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
	movl	-76(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %esi
	subl	%eax, %esi
	movl	-84(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	%esi, %eax
	movl	%eax, -28(%rbp)
	movl	$0, -48(%rbp)
	jmp	.L15
.L24:
	movl	$0, -32(%rbp)
	jmp	.L16
.L23:
	call	clock
	movq	%rax, -24(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L17
.L22:
	movl	$0, -40(%rbp)
	jmp	.L18
.L21:
	movl	$0, -36(%rbp)
	jmp	.L19
.L20:
	movl	-40(%rbp), %eax
	movl	-48(%rbp), %edx
	addl	%edx, %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-36(%rbp), %eax
	addl	%eax, %edx
	movl	-32(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rax, %rdx
	movl	-40(%rbp), %eax
	movl	-48(%rbp), %ecx
	addl	%ecx, %eax
	imull	-84(%rbp), %eax
	movl	%eax, %ecx
	movl	-36(%rbp), %eax
	addl	%eax, %ecx
	movl	-32(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-72(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movl	-40(%rbp), %eax
	movl	-48(%rbp), %ecx
	addl	%ecx, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %ecx
	movl	-44(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm2
	movl	-32(%rbp), %eax
	movl	-36(%rbp), %ecx
	addl	%eax, %ecx
	movl	-44(%rbp), %eax
	imull	-84(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-64(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rdx)
	addl	$1, -36(%rbp)
.L19:
	cmpl	$79, -36(%rbp)
	jle	.L20
	addl	$1, -40(%rbp)
.L18:
	cmpl	$79, -40(%rbp)
	jle	.L21
	addl	$1, -44(%rbp)
.L17:
	movl	-44(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jl	.L22
	call	clock
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-28(%rbp), %ecx
	movl	-32(%rbp), %edx
	movl	-48(%rbp), %esi
	movq	%rax, -96(%rbp)
	movsd	-96(%rbp), %xmm0
	movl	$.LC5, %edi
	movl	$1, %eax
	call	printf
	addl	$80, -32(%rbp)
.L16:
	movl	-32(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L23
	addl	$80, -48(%rbp)
.L15:
	movl	-48(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L24
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	tiling_mm, .-tiling_mm
	.section	.rodata
	.align 4
.LC0:
	.long	0
	.align 8
.LC1:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits

