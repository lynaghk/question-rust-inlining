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
	testq	%rsi, %rsi
	je	LBB0_1
## %bb.2:                               ## %bb7.preheader
	movl	%esi, %r8d
	andl	$1, %r8d
	cmpq	$1, %rsi
	jne	LBB0_7
## %bb.3:
	xorl	%eax, %eax
	testq	%r8, %r8
	jne	LBB0_5
	jmp	LBB0_6
LBB0_1:
	xorl	%eax, %eax
	popq	%rbp
	retq
LBB0_7:                                 ## %bb7.preheader.new
	movq	%r8, %r9
	subq	%rsi, %r9
	xorl	%r10d, %r10d
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB0_8:                                 ## %bb7
                                        ## =>This Inner Loop Header: Depth=1
	movzbl	(%rdi), %ecx
	movzbl	1(%rdi), %edx
	addb	$-65, %cl
	movzbl	%cl, %ecx
	leaq	1(%rcx), %rsi
	cmpb	$4, %cl
	cmovaeq	%r10, %rsi
	addq	%rax, %rsi
	addq	$2, %rdi
	addb	$-65, %dl
	movzbl	%dl, %ecx
	leaq	1(%rcx), %rax
	cmpb	$4, %cl
	cmovaeq	%r10, %rax
	addq	%rsi, %rax
	addq	$2, %r9
	jne	LBB0_8
## %bb.4:                               ## %bb5.loopexit.unr-lcssa
	testq	%r8, %r8
	je	LBB0_6
LBB0_5:                                 ## %bb7.epil
	movb	(%rdi), %cl
	addb	$-65, %cl
	movzbl	%cl, %ecx
	leaq	1(%rcx), %rdx
	xorl	%esi, %esi
	cmpb	$4, %cl
	cmovbq	%rdx, %rsi
	addq	%rsi, %rax
LBB0_6:                                 ## %bb5
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
