	.section	__TEXT,__text,regular,pure_instructions
	.globl	_fun                    ## -- Begin function fun
	.p2align	4, 0x90
_fun:                                   ## @fun
	.cfi_startproc
## %bb.0:                               ## %start
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	addq	%rdi, %rsi
	xorl	%r9d, %r9d
	xorl	%eax, %eax
	xorl	%r10d, %r10d
	.p2align	4, 0x90
LBB0_1:                                 ## %bb6
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
	movl	%r10d, %r8d
	andl	$63, %r8d
	movl	%r10d, %r11d
	negl	%r11d
	andl	$63, %r11d
	movq	$-32, %r15
	movq	%r10, %rcx
	incq	%r10
	movq	%rdi, %r14
	.p2align	4, 0x90
LBB0_2:                                 ## %bb1.i
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	testq	%rcx, %rcx
	je	LBB0_3
## %bb.5:                               ## %bb2.i.i
                                        ##   in Loop: Header=BB0_2 Depth=2
	movq	%rsi, %rbx
	subq	%r14, %rbx
	cmpq	%rcx, %rbx
	jbe	LBB0_8
## %bb.6:                               ## %bb8.i.i.i
                                        ##   in Loop: Header=BB0_2 Depth=2
	leaq	(%r14,%rcx), %rbx
	leaq	1(%r14,%rcx), %r14
	testq	%rbx, %rbx
	jne	LBB0_10
	jmp	LBB0_8
	.p2align	4, 0x90
LBB0_3:                                 ## %bb1.i.i
                                        ##   in Loop: Header=BB0_2 Depth=2
	cmpq	%r14, %rsi
	je	LBB0_8
## %bb.4:                               ## %bb9.i.i.i
                                        ##   in Loop: Header=BB0_2 Depth=2
	movq	%r14, %rbx
	incq	%r14
	testq	%rbx, %rbx
	je	LBB0_8
LBB0_10:                                ## %bb15
                                        ##   in Loop: Header=BB0_2 Depth=2
	movzbl	(%rbx), %ecx
	addb	$-65, %cl
	movzbl	%cl, %ecx
	leaq	1(%rcx), %rbx
	cmpb	$4, %cl
	cmovaeq	%r9, %rbx
	movq	%rbx, %rdx
	movl	%r8d, %ecx
	shlq	%cl, %rdx
	movl	%r11d, %ecx
	shrq	%cl, %rbx
	orq	%rdx, %rbx
	xorq	%rbx, %rax
	incq	%r15
	movl	$0, %ecx
	jne	LBB0_2
LBB0_8:                                 ## %bb14
                                        ##   in Loop: Header=BB0_1 Depth=1
	cmpq	$1000, %r10             ## imm = 0x3E8
	jne	LBB0_1
## %bb.9:                               ## %bb4
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
