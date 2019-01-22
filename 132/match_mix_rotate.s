	.section	__TEXT,__text,regular,pure_instructions
	.globl	_mix_rotate             ## -- Begin function mix_rotate
	.p2align	4, 0x90
_mix_rotate:                            ## @mix_rotate
	.cfi_startproc
## %bb.0:                               ## %start
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	addq	%rdi, %r15
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB0_1:                                 ## %bb6
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
	leaq	1(%r12), %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	$-32, %r14
	movq	%r12, %rax
	movq	-48(%rbp), %r13         ## 8-byte Reload
	.p2align	4, 0x90
LBB0_2:                                 ## %bb1.i
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	testq	%rax, %rax
	je	LBB0_3
## %bb.5:                               ## %bb2.i.i
                                        ##   in Loop: Header=BB0_2 Depth=2
	movq	%r15, %rcx
	subq	%r13, %rcx
	cmpq	%rax, %rcx
	jbe	LBB0_8
## %bb.6:                               ## %bb8.i.i.i
                                        ##   in Loop: Header=BB0_2 Depth=2
	leaq	(%r13,%rax), %rcx
	leaq	1(%r13,%rax), %r13
	testq	%rcx, %rcx
	jne	LBB0_10
	jmp	LBB0_8
	.p2align	4, 0x90
LBB0_3:                                 ## %bb1.i.i
                                        ##   in Loop: Header=BB0_2 Depth=2
	cmpq	%r13, %r15
	je	LBB0_8
## %bb.4:                               ## %bb9.i.i.i
                                        ##   in Loop: Header=BB0_2 Depth=2
	movq	%r13, %rcx
	incq	%r13
	testq	%rcx, %rcx
	je	LBB0_8
LBB0_10:                                ## %bb15
                                        ##   in Loop: Header=BB0_2 Depth=2
	movzbl	(%rcx), %eax
	addb	$-65, %al
	movzbl	%al, %eax
	leaq	1(%rax), %rdi
	cmpb	$4, %al
	movl	$0, %eax
	cmovaeq	%rax, %rdi
	movq	%rdi, %rsi
	movq	%r12, %rdx
	callq	_llvm.fshl.i64
	xorq	%rax, %rbx
	incq	%r14
	movl	$0, %eax
	jne	LBB0_2
LBB0_8:                                 ## %bb14
                                        ##   in Loop: Header=BB0_1 Depth=1
	movq	-56(%rbp), %r12         ## 8-byte Reload
	cmpq	$1000, %r12             ## imm = 0x3E8
	jne	LBB0_1
## %bb.9:                               ## %bb4
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
