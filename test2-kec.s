	.text
	.file	"test2-kec.cpp"
	.file	1 "/home/ethanf/A/pro/HPC" "test2-kec.cpp"
	.file	2 "/usr/bin/../lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/x86_64-pc-linux-gnu/bits" "c++config.h"
	.file	3 "/usr/include" "stdlib.h"
	.file	4 "/usr/bin/../lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/bits" "std_abs.h"
	.file	5 "/usr/bin/../lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0" "cstdlib"
	.file	6 "/usr/include/bits" "stdlib-float.h"
	.file	7 "/usr/include/bits" "stdlib-bsearch.h"
	.file	8 "/usr/lib/clang/11.0.0/include" "stddef.h"
	.file	9 "/usr/bin/../lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0" "stdlib.h"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI0_0:
	.quad	0x4008000000000000              # double 3
.LCPI0_1:
	.quad	0xbff0000000000000              # double -1
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI0_2:
	.long	0x4e6e6b28                      # float 1.0E+9
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.loc	1 29 0                          # test2-kec.cpp:29:0
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception0
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%fs:40, %rax
	movq	%rax, 48(%rsp)
	xorl	%r13d, %r13d
.Ltmp9:
	#DEBUG_VALUE: i <- 0
	leaq	_ZZ4mainE1a(%rip), %r14
	leaq	_ZZ4mainE1b(%rip), %r15
	leaq	_ZZ4mainE1c(%rip), %r12
.Ltmp10:
	.p2align	4, 0x90
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	xorl	%ebx, %ebx
.Ltmp11:
	#DEBUG_VALUE: j <- 0
	#DEBUG_VALUE: i <- $r13
	.p2align	4, 0x90
.LBB0_2:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: i <- $r13
	#DEBUG_VALUE: j <- $rbx
	.loc	1 38 29 prologue_end            # test2-kec.cpp:38:29
	callq	drand48@PLT
.Ltmp12:
	.loc	1 0 29 is_stmt 0                # test2-kec.cpp:0:29
	movsd	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero
	.loc	1 38 28                         # test2-kec.cpp:38:28
	mulsd	%xmm1, %xmm0
	movsd	.LCPI0_1(%rip), %xmm1           # xmm1 = mem[0],zero
	.loc	1 38 39                         # test2-kec.cpp:38:39
	addsd	%xmm1, %xmm0
	.loc	1 38 27                         # test2-kec.cpp:38:27
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	.loc	1 38 17                         # test2-kec.cpp:38:17
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	_ZN6MatrixixEm
.Ltmp13:
	.loc	1 0 17                          # test2-kec.cpp:0:17
	movss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	.loc	1 38 25                         # test2-kec.cpp:38:25
	movss	%xmm0, (%rax,%rbx,4)
	.loc	1 39 29 is_stmt 1               # test2-kec.cpp:39:29
	callq	drand48@PLT
.Ltmp14:
	.loc	1 39 28 is_stmt 0               # test2-kec.cpp:39:28
	mulsd	.LCPI0_0(%rip), %xmm0
	.loc	1 39 39                         # test2-kec.cpp:39:39
	addsd	.LCPI0_1(%rip), %xmm0
	.loc	1 39 27                         # test2-kec.cpp:39:27
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	.loc	1 39 17                         # test2-kec.cpp:39:17
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	_ZN6MatrixixEm
.Ltmp15:
	.loc	1 0 17                          # test2-kec.cpp:0:17
	movss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	.loc	1 39 25                         # test2-kec.cpp:39:25
	movss	%xmm0, (%rax,%rbx,4)
	.loc	1 40 17 is_stmt 1               # test2-kec.cpp:40:17
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	_ZN6MatrixixEm
.Ltmp16:
	.loc	1 40 25 is_stmt 0               # test2-kec.cpp:40:25
	movl	$0, (%rax,%rbx,4)
.Ltmp17:
	.loc	1 37 48 is_stmt 1               # test2-kec.cpp:37:48
	addq	$1, %rbx
.Ltmp18:
	#DEBUG_VALUE: j <- $rbx
	.loc	1 37 39 is_stmt 0               # test2-kec.cpp:37:39
	cmpq	$1024, %rbx                     # imm = 0x400
.Ltmp19:
	.loc	1 37 13                         # test2-kec.cpp:37:13
	jne	.LBB0_2
.Ltmp20:
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: i <- $r13
	.loc	1 36 44 is_stmt 1               # test2-kec.cpp:36:44
	addq	$1, %r13
.Ltmp21:
	#DEBUG_VALUE: i <- $r13
	.loc	1 36 35 is_stmt 0               # test2-kec.cpp:36:35
	cmpq	$1024, %r13                     # imm = 0x400
.Ltmp22:
	.loc	1 36 9                          # test2-kec.cpp:36:9
	jne	.LBB0_1
.Ltmp23:
# %bb.4:
	.loc	1 0 9                           # test2-kec.cpp:0:9
	xorl	%r13d, %r13d
	leaq	32(%rsp), %rsi
	.loc	1 47 9 is_stmt 1                # test2-kec.cpp:47:9
	xorl	%edi, %edi
	callq	clock_gettime@PLT
.Ltmp24:
	.loc	1 0 9 is_stmt 0                 # test2-kec.cpp:0:9
	leaq	_ZZ4mainE1a(%rip), %r14
	leaq	_ZZ4mainE1b(%rip), %r15
	leaq	_ZZ4mainE1c(%rip), %r12
.Ltmp25:
	#DEBUG_VALUE: k <- 0
	.p2align	4, 0x90
.LBB0_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_7 Depth 3
	xorl	%ebx, %ebx
.Ltmp26:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: k <- $r13
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_7 Depth 3
	#DEBUG_VALUE: k <- $r13
	xorl	%ebp, %ebp
.Ltmp27:
	#DEBUG_VALUE: j <- 0
	#DEBUG_VALUE: i <- $rbx
	.p2align	4, 0x90
.LBB0_7:                                #   Parent Loop BB0_5 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: k <- $r13
	#DEBUG_VALUE: i <- $rbx
	#DEBUG_VALUE: j <- $rbp
	.loc	1 51 32 is_stmt 1               # test2-kec.cpp:51:32
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_ZN6MatrixixEm
.Ltmp28:
	movss	(%rax,%r13,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	.loc	1 51 40 is_stmt 0               # test2-kec.cpp:51:40
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	_ZN6MatrixixEm
.Ltmp29:
	.loc	1 0 40                          # test2-kec.cpp:0:40
	movss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	.loc	1 51 39                         # test2-kec.cpp:51:39
	mulss	(%rax,%rbp,4), %xmm0
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	.loc	1 51 21                         # test2-kec.cpp:51:21
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	_ZN6MatrixixEm
.Ltmp30:
	.loc	1 0 21                          # test2-kec.cpp:0:21
	movss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	.loc	1 51 29                         # test2-kec.cpp:51:29
	addss	(%rax,%rbp,4), %xmm0
	movss	%xmm0, (%rax,%rbp,4)
.Ltmp31:
	.loc	1 50 43 is_stmt 1               # test2-kec.cpp:50:43
	addq	$1, %rbp
.Ltmp32:
	#DEBUG_VALUE: j <- $rbp
	.loc	1 50 34 is_stmt 0               # test2-kec.cpp:50:34
	cmpq	$1024, %rbp                     # imm = 0x400
.Ltmp33:
	.loc	1 50 17                         # test2-kec.cpp:50:17
	jne	.LBB0_7
.Ltmp34:
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=2
	#DEBUG_VALUE: k <- $r13
	#DEBUG_VALUE: i <- $rbx
	.loc	1 49 39 is_stmt 1               # test2-kec.cpp:49:39
	addq	$1, %rbx
.Ltmp35:
	#DEBUG_VALUE: i <- $rbx
	.loc	1 49 30 is_stmt 0               # test2-kec.cpp:49:30
	cmpq	$1024, %rbx                     # imm = 0x400
.Ltmp36:
	.loc	1 49 13                         # test2-kec.cpp:49:13
	jne	.LBB0_6
.Ltmp37:
# %bb.9:                                #   in Loop: Header=BB0_5 Depth=1
	#DEBUG_VALUE: k <- $r13
	.loc	1 48 35 is_stmt 1               # test2-kec.cpp:48:35
	addq	$1, %r13
.Ltmp38:
	#DEBUG_VALUE: k <- $r13
	.loc	1 48 26 is_stmt 0               # test2-kec.cpp:48:26
	cmpq	$1024, %r13                     # imm = 0x400
.Ltmp39:
	.loc	1 48 9                          # test2-kec.cpp:48:9
	jne	.LBB0_5
.Ltmp40:
# %bb.10:
	.loc	1 0 9                           # test2-kec.cpp:0:9
	leaq	16(%rsp), %rsi
	.loc	1 56 9 is_stmt 1                # test2-kec.cpp:56:9
	xorl	%edi, %edi
	callq	clock_gettime@PLT
.Ltmp41:
	.loc	1 57 23                         # test2-kec.cpp:57:23
	movq	16(%rsp), %rax
	.loc	1 57 30 is_stmt 0               # test2-kec.cpp:57:30
	subq	32(%rsp), %rax
	.loc	1 57 17                         # test2-kec.cpp:57:17
	xorps	%xmm0, %xmm0
	cvtsi2ss	%rax, %xmm0
	.loc	1 57 52                         # test2-kec.cpp:57:52
	movq	24(%rsp), %rax
	.loc	1 57 60                         # test2-kec.cpp:57:60
	subq	40(%rsp), %rax
	.loc	1 57 46                         # test2-kec.cpp:57:46
	cvtsi2ss	%rax, %xmm1
	.loc	1 57 76                         # test2-kec.cpp:57:76
	divss	.LCPI0_2(%rip), %xmm1
	.loc	1 57 45                         # test2-kec.cpp:57:45
	addss	%xmm0, %xmm1
.Ltmp42:
	#DEBUG_VALUE: dtime <- $xmm1
	.loc	1 58 28 is_stmt 1               # test2-kec.cpp:58:28
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm0
	.loc	1 58 9 is_stmt 0                # test2-kec.cpp:58:9
	leaq	.L.str(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
.Ltmp43:
	.loc	1 61 9 is_stmt 1                # test2-kec.cpp:61:9
	movb	_ZGVZ4mainE1a_0(%rip), %al
	testb	%al, %al
	je	.LBB0_11
.LBB0_14:
	.loc	1 62 9                          # test2-kec.cpp:62:9
	movb	_ZGVZ4mainE1b_0(%rip), %al
	testb	%al, %al
	je	.LBB0_15
.LBB0_18:
	.loc	1 63 9                          # test2-kec.cpp:63:9
	movb	_ZGVZ4mainE1c_0(%rip), %al
	testb	%al, %al
	je	.LBB0_19
.LBB0_22:
	.loc	1 0 9 is_stmt 0                 # test2-kec.cpp:0:9
	xorl	%r13d, %r13d
	leaq	_ZZ4mainE1a_0(%rip), %r14
	leaq	_ZZ4mainE1b_0(%rip), %r15
	leaq	_ZZ4mainE1c_0(%rip), %r12
	.p2align	4, 0x90
.LBB0_23:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_24 Depth 2
	xorl	%ebx, %ebx
.Ltmp44:
	#DEBUG_VALUE: j <- 0
	#DEBUG_VALUE: i <- $r13
	.p2align	4, 0x90
.LBB0_24:                               #   Parent Loop BB0_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: i <- $r13
	#DEBUG_VALUE: j <- $rbx
	.loc	1 67 29 is_stmt 1               # test2-kec.cpp:67:29
	callq	drand48@PLT
.Ltmp45:
	.loc	1 0 29 is_stmt 0                # test2-kec.cpp:0:29
	movsd	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero
	.loc	1 67 28                         # test2-kec.cpp:67:28
	mulsd	%xmm1, %xmm0
	movsd	.LCPI0_1(%rip), %xmm1           # xmm1 = mem[0],zero
	.loc	1 67 39                         # test2-kec.cpp:67:39
	addsd	%xmm1, %xmm0
	.loc	1 67 27                         # test2-kec.cpp:67:27
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	.loc	1 67 17                         # test2-kec.cpp:67:17
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	_ZN7Matrix2ixEm
.Ltmp46:
	.loc	1 0 17                          # test2-kec.cpp:0:17
	movss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	.loc	1 67 25                         # test2-kec.cpp:67:25
	movss	%xmm0, (%rax,%rbx,4)
	.loc	1 68 29 is_stmt 1               # test2-kec.cpp:68:29
	callq	drand48@PLT
.Ltmp47:
	.loc	1 68 28 is_stmt 0               # test2-kec.cpp:68:28
	mulsd	.LCPI0_0(%rip), %xmm0
	.loc	1 68 39                         # test2-kec.cpp:68:39
	addsd	.LCPI0_1(%rip), %xmm0
	.loc	1 68 27                         # test2-kec.cpp:68:27
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	.loc	1 68 17                         # test2-kec.cpp:68:17
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	_ZN7Matrix2ixEm
.Ltmp48:
	.loc	1 0 17                          # test2-kec.cpp:0:17
	movss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	.loc	1 68 25                         # test2-kec.cpp:68:25
	movss	%xmm0, (%rax,%rbx,4)
	.loc	1 69 17 is_stmt 1               # test2-kec.cpp:69:17
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	_ZN7Matrix2ixEm
.Ltmp49:
	.loc	1 69 25 is_stmt 0               # test2-kec.cpp:69:25
	movl	$0, (%rax,%rbx,4)
.Ltmp50:
	.loc	1 66 48 is_stmt 1               # test2-kec.cpp:66:48
	addq	$1, %rbx
.Ltmp51:
	#DEBUG_VALUE: j <- $rbx
	.loc	1 66 39 is_stmt 0               # test2-kec.cpp:66:39
	cmpq	$1024, %rbx                     # imm = 0x400
.Ltmp52:
	.loc	1 66 13                         # test2-kec.cpp:66:13
	jne	.LBB0_24
.Ltmp53:
# %bb.25:                               #   in Loop: Header=BB0_23 Depth=1
	#DEBUG_VALUE: i <- $r13
	.loc	1 65 44 is_stmt 1               # test2-kec.cpp:65:44
	addq	$1, %r13
.Ltmp54:
	#DEBUG_VALUE: i <- $r13
	.loc	1 65 35 is_stmt 0               # test2-kec.cpp:65:35
	cmpq	$1024, %r13                     # imm = 0x400
.Ltmp55:
	.loc	1 65 9                          # test2-kec.cpp:65:9
	jne	.LBB0_23
.Ltmp56:
# %bb.26:
	.loc	1 0 9                           # test2-kec.cpp:0:9
	xorl	%r13d, %r13d
	leaq	32(%rsp), %rsi
	.loc	1 76 9 is_stmt 1                # test2-kec.cpp:76:9
	xorl	%edi, %edi
	callq	clock_gettime@PLT
.Ltmp57:
	.loc	1 0 9 is_stmt 0                 # test2-kec.cpp:0:9
	leaq	_ZZ4mainE1a_0(%rip), %r14
	leaq	_ZZ4mainE1b_0(%rip), %r15
	leaq	_ZZ4mainE1c_0(%rip), %r12
.Ltmp58:
	#DEBUG_VALUE: k <- 0
	.p2align	4, 0x90
.LBB0_27:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_28 Depth 2
                                        #       Child Loop BB0_29 Depth 3
	xorl	%ebx, %ebx
.Ltmp59:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: k <- $r13
	.p2align	4, 0x90
.LBB0_28:                               #   Parent Loop BB0_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_29 Depth 3
	#DEBUG_VALUE: k <- $r13
	xorl	%ebp, %ebp
.Ltmp60:
	#DEBUG_VALUE: j <- 0
	#DEBUG_VALUE: i <- $rbx
	.p2align	4, 0x90
.LBB0_29:                               #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_28 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: k <- $r13
	#DEBUG_VALUE: i <- $rbx
	#DEBUG_VALUE: j <- $rbp
	.loc	1 80 32 is_stmt 1               # test2-kec.cpp:80:32
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_ZN7Matrix2ixEm
.Ltmp61:
	movss	(%rax,%r13,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	.loc	1 80 40 is_stmt 0               # test2-kec.cpp:80:40
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	_ZN7Matrix2ixEm
.Ltmp62:
	.loc	1 0 40                          # test2-kec.cpp:0:40
	movss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	.loc	1 80 39                         # test2-kec.cpp:80:39
	mulss	(%rax,%rbp,4), %xmm0
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	.loc	1 80 21                         # test2-kec.cpp:80:21
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	_ZN7Matrix2ixEm
.Ltmp63:
	.loc	1 0 21                          # test2-kec.cpp:0:21
	movss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	.loc	1 80 29                         # test2-kec.cpp:80:29
	addss	(%rax,%rbp,4), %xmm0
	movss	%xmm0, (%rax,%rbp,4)
.Ltmp64:
	.loc	1 79 43 is_stmt 1               # test2-kec.cpp:79:43
	addq	$1, %rbp
.Ltmp65:
	#DEBUG_VALUE: j <- $rbp
	.loc	1 79 34 is_stmt 0               # test2-kec.cpp:79:34
	cmpq	$1024, %rbp                     # imm = 0x400
.Ltmp66:
	.loc	1 79 17                         # test2-kec.cpp:79:17
	jne	.LBB0_29
.Ltmp67:
# %bb.30:                               #   in Loop: Header=BB0_28 Depth=2
	#DEBUG_VALUE: k <- $r13
	#DEBUG_VALUE: i <- $rbx
	.loc	1 78 39 is_stmt 1               # test2-kec.cpp:78:39
	addq	$1, %rbx
.Ltmp68:
	#DEBUG_VALUE: i <- $rbx
	.loc	1 78 30 is_stmt 0               # test2-kec.cpp:78:30
	cmpq	$1024, %rbx                     # imm = 0x400
.Ltmp69:
	.loc	1 78 13                         # test2-kec.cpp:78:13
	jne	.LBB0_28
.Ltmp70:
# %bb.31:                               #   in Loop: Header=BB0_27 Depth=1
	#DEBUG_VALUE: k <- $r13
	.loc	1 77 35 is_stmt 1               # test2-kec.cpp:77:35
	addq	$1, %r13
.Ltmp71:
	#DEBUG_VALUE: k <- $r13
	.loc	1 77 26 is_stmt 0               # test2-kec.cpp:77:26
	cmpq	$1024, %r13                     # imm = 0x400
.Ltmp72:
	.loc	1 77 9                          # test2-kec.cpp:77:9
	jne	.LBB0_27
.Ltmp73:
# %bb.32:
	.loc	1 0 9                           # test2-kec.cpp:0:9
	leaq	16(%rsp), %rsi
	.loc	1 85 9 is_stmt 1                # test2-kec.cpp:85:9
	xorl	%edi, %edi
	callq	clock_gettime@PLT
.Ltmp74:
	.loc	1 86 23                         # test2-kec.cpp:86:23
	movq	16(%rsp), %rax
	.loc	1 86 30 is_stmt 0               # test2-kec.cpp:86:30
	subq	32(%rsp), %rax
	.loc	1 86 17                         # test2-kec.cpp:86:17
	xorps	%xmm0, %xmm0
	cvtsi2ss	%rax, %xmm0
	.loc	1 86 52                         # test2-kec.cpp:86:52
	movq	24(%rsp), %rax
	.loc	1 86 60                         # test2-kec.cpp:86:60
	subq	40(%rsp), %rax
	.loc	1 86 46                         # test2-kec.cpp:86:46
	cvtsi2ss	%rax, %xmm1
	.loc	1 86 76                         # test2-kec.cpp:86:76
	divss	.LCPI0_2(%rip), %xmm1
	.loc	1 86 45                         # test2-kec.cpp:86:45
	addss	%xmm0, %xmm1
.Ltmp75:
	#DEBUG_VALUE: dtime <- $xmm1
	.loc	1 87 28 is_stmt 1               # test2-kec.cpp:87:28
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm0
	.loc	1 87 9 is_stmt 0                # test2-kec.cpp:87:9
	leaq	.L.str(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
.Ltmp76:
	.loc	1 0 9                           # test2-kec.cpp:0:9
	movq	%fs:40, %rax
	cmpq	48(%rsp), %rax
	jne	.LBB0_38
.Ltmp77:
# %bb.33:
	.loc	1 89 1 is_stmt 1                # test2-kec.cpp:89:1
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB0_11:
	.cfi_def_cfa_offset 112
.Ltmp78:
	.loc	1 61 9                          # test2-kec.cpp:61:9
	leaq	_ZGVZ4mainE1a_0(%rip), %rbx
	movq	%rbx, %rdi
	callq	__cxa_guard_acquire@PLT
.Ltmp79:
	testl	%eax, %eax
	je	.LBB0_14
# %bb.12:
.Ltmp0:
	.loc	1 61 24 is_stmt 0               # test2-kec.cpp:61:24
	leaq	_ZZ4mainE1a_0(%rip), %rdi
	callq	_ZN7Matrix2C2Ev
.Ltmp80:
.Ltmp1:
# %bb.13:
	.loc	1 61 9                          # test2-kec.cpp:61:9
	leaq	_ZN7Matrix2D2Ev(%rip), %rdi
	leaq	_ZZ4mainE1a_0(%rip), %rsi
	leaq	__dso_handle(%rip), %rdx
	callq	__cxa_atexit@PLT
.Ltmp81:
	leaq	_ZGVZ4mainE1a_0(%rip), %rdi
	callq	__cxa_guard_release@PLT
.Ltmp82:
	.loc	1 0 9                           # test2-kec.cpp:0:9
	jmp	.LBB0_14
.LBB0_15:
	.loc	1 62 9 is_stmt 1                # test2-kec.cpp:62:9
	leaq	_ZGVZ4mainE1b_0(%rip), %rbx
	movq	%rbx, %rdi
	callq	__cxa_guard_acquire@PLT
.Ltmp83:
	testl	%eax, %eax
	je	.LBB0_18
# %bb.16:
.Ltmp3:
	.loc	1 62 24 is_stmt 0               # test2-kec.cpp:62:24
	leaq	_ZZ4mainE1b_0(%rip), %rdi
	callq	_ZN7Matrix2C2Ev
.Ltmp84:
.Ltmp4:
# %bb.17:
	.loc	1 62 9                          # test2-kec.cpp:62:9
	leaq	_ZN7Matrix2D2Ev(%rip), %rdi
	leaq	_ZZ4mainE1b_0(%rip), %rsi
	leaq	__dso_handle(%rip), %rdx
	callq	__cxa_atexit@PLT
.Ltmp85:
	leaq	_ZGVZ4mainE1b_0(%rip), %rdi
	callq	__cxa_guard_release@PLT
.Ltmp86:
	.loc	1 0 9                           # test2-kec.cpp:0:9
	jmp	.LBB0_18
.LBB0_19:
	.loc	1 63 9 is_stmt 1                # test2-kec.cpp:63:9
	leaq	_ZGVZ4mainE1c_0(%rip), %rbx
	movq	%rbx, %rdi
	callq	__cxa_guard_acquire@PLT
.Ltmp87:
	testl	%eax, %eax
	je	.LBB0_22
# %bb.20:
.Ltmp6:
	.loc	1 63 24 is_stmt 0               # test2-kec.cpp:63:24
	leaq	_ZZ4mainE1c_0(%rip), %rdi
	callq	_ZN7Matrix2C2Ev
.Ltmp88:
.Ltmp7:
# %bb.21:
	.loc	1 63 9                          # test2-kec.cpp:63:9
	leaq	_ZN7Matrix2D2Ev(%rip), %rdi
	leaq	_ZZ4mainE1c_0(%rip), %rsi
	leaq	__dso_handle(%rip), %rdx
	callq	__cxa_atexit@PLT
.Ltmp89:
	leaq	_ZGVZ4mainE1c_0(%rip), %rdi
	callq	__cxa_guard_release@PLT
.Ltmp90:
	.loc	1 0 9                           # test2-kec.cpp:0:9
	jmp	.LBB0_22
.Ltmp91:
.LBB0_38:
	callq	__stack_chk_fail@PLT
.Ltmp92:
.LBB0_35:
.Ltmp8:
	jmp	.LBB0_37
.LBB0_34:
.Ltmp5:
	jmp	.LBB0_37
.LBB0_36:
.Ltmp2:
.LBB0_37:
	movq	%rax, %r14
.Ltmp93:
	movq	%rbx, %rdi
	callq	__cxa_guard_abort@PLT
.Ltmp94:
	movq	%r14, %rdi
	callq	_Unwind_Resume@PLT
.Ltmp95:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
	.file	10 "/usr/include" "time.h"
	.file	11 "/usr/include/bits" "types.h"
	.file	12 "/usr/include/bits/types" "struct_timespec.h"
	.section	.gcc_except_table,"a",@progbits
	.p2align	2
GCC_except_table0:
.Lexception0:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end0-.Lcst_begin0
.Lcst_begin0:
	.uleb128 .Ltmp0-.Lfunc_begin0           # >> Call Site 1 <<
	.uleb128 .Ltmp1-.Ltmp0                  #   Call between .Ltmp0 and .Ltmp1
	.uleb128 .Ltmp2-.Lfunc_begin0           #     jumps to .Ltmp2
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp3-.Lfunc_begin0           # >> Call Site 2 <<
	.uleb128 .Ltmp4-.Ltmp3                  #   Call between .Ltmp3 and .Ltmp4
	.uleb128 .Ltmp5-.Lfunc_begin0           #     jumps to .Ltmp5
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp6-.Lfunc_begin0           # >> Call Site 3 <<
	.uleb128 .Ltmp7-.Ltmp6                  #   Call between .Ltmp6 and .Ltmp7
	.uleb128 .Ltmp8-.Lfunc_begin0           #     jumps to .Ltmp8
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp7-.Lfunc_begin0           # >> Call Site 4 <<
	.uleb128 .Lfunc_end0-.Ltmp7             #   Call between .Ltmp7 and .Lfunc_end0
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end0:
	.p2align	2
                                        # -- End function
	.section	.text._ZN6MatrixixEm,"axG",@progbits,_ZN6MatrixixEm,comdat
	.weak	_ZN6MatrixixEm                  # -- Begin function _ZN6MatrixixEm
	.p2align	4, 0x90
	.type	_ZN6MatrixixEm,@function
_ZN6MatrixixEm:                         # @_ZN6MatrixixEm
.Lfunc_begin1:
	.loc	1 14 0 is_stmt 1                # test2-kec.cpp:14:0
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: operator[]:this <- $rdi
	#DEBUG_VALUE: operator[]:this <- $rdi
	#DEBUG_VALUE: operator[]:i <- $rsi
	#DEBUG_VALUE: operator[]:i <- $rsi
	.loc	1 14 51 prologue_end            # test2-kec.cpp:14:51
	shlq	$12, %rsi
.Ltmp96:
	#DEBUG_VALUE: operator[]:i <- [DW_OP_LLVM_entry_value 1] $rsi
	leaq	(%rsi,%rdi), %rax
	.loc	1 14 44 is_stmt 0               # test2-kec.cpp:14:44
	retq
.Ltmp97:
.Lfunc_end1:
	.size	_ZN6MatrixixEm, .Lfunc_end1-_ZN6MatrixixEm
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN7Matrix2C2Ev,"axG",@progbits,_ZN7Matrix2C2Ev,comdat
	.weak	_ZN7Matrix2C2Ev                 # -- Begin function _ZN7Matrix2C2Ev
	.p2align	4, 0x90
	.type	_ZN7Matrix2C2Ev,@function
_ZN7Matrix2C2Ev:                        # @_ZN7Matrix2C2Ev
.Lfunc_begin2:
	.loc	1 21 0 is_stmt 1                # test2-kec.cpp:21:0
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: Matrix2:this <- $rdi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
.Ltmp98:
	#DEBUG_VALUE: Matrix2:this <- $rbx
	.loc	1 21 26 prologue_end            # test2-kec.cpp:21:26
	movl	$4194304, %edi                  # imm = 0x400000
	callq	_Znam@PLT
.Ltmp99:
	.loc	1 21 21 is_stmt 0               # test2-kec.cpp:21:21
	movq	%rax, (%rbx)
	.loc	1 21 49                         # test2-kec.cpp:21:49
	popq	%rbx
.Ltmp100:
	#DEBUG_VALUE: Matrix2:this <- [DW_OP_LLVM_entry_value 1] $rdi
	.cfi_def_cfa_offset 8
	retq
.Ltmp101:
.Lfunc_end2:
	.size	_ZN7Matrix2C2Ev, .Lfunc_end2-_ZN7Matrix2C2Ev
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN7Matrix2D2Ev,"axG",@progbits,_ZN7Matrix2D2Ev,comdat
	.weak	_ZN7Matrix2D2Ev                 # -- Begin function _ZN7Matrix2D2Ev
	.p2align	4, 0x90
	.type	_ZN7Matrix2D2Ev,@function
_ZN7Matrix2D2Ev:                        # @_ZN7Matrix2D2Ev
.Lfunc_begin3:
	.loc	1 22 0 is_stmt 1                # test2-kec.cpp:22:0
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: ~Matrix2:this <- $rdi
	#DEBUG_VALUE: ~Matrix2:this <- $rdi
	pushq	%rax
	.cfi_def_cfa_offset 16
.Ltmp102:
	.loc	1 22 32 prologue_end            # test2-kec.cpp:22:32
	movq	(%rdi), %rdi
.Ltmp103:
	#DEBUG_VALUE: ~Matrix2:this <- [DW_OP_LLVM_entry_value 1] $rdi
	.loc	1 22 22 is_stmt 0               # test2-kec.cpp:22:22
	testq	%rdi, %rdi
	je	.LBB3_2
.Ltmp104:
# %bb.1:
	#DEBUG_VALUE: ~Matrix2:this <- [DW_OP_LLVM_entry_value 1] $rdi
	callq	_ZdaPv@PLT
.Ltmp105:
.LBB3_2:
	#DEBUG_VALUE: ~Matrix2:this <- [DW_OP_LLVM_entry_value 1] $rdi
	.loc	1 22 38                         # test2-kec.cpp:22:38
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Ltmp106:
.Lfunc_end3:
	.size	_ZN7Matrix2D2Ev, .Lfunc_end3-_ZN7Matrix2D2Ev
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN7Matrix2ixEm,"axG",@progbits,_ZN7Matrix2ixEm,comdat
	.weak	_ZN7Matrix2ixEm                 # -- Begin function _ZN7Matrix2ixEm
	.p2align	4, 0x90
	.type	_ZN7Matrix2ixEm,@function
_ZN7Matrix2ixEm:                        # @_ZN7Matrix2ixEm
.Lfunc_begin4:
	.loc	1 23 0 is_stmt 1                # test2-kec.cpp:23:0
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: operator[]:this <- $rdi
	#DEBUG_VALUE: operator[]:i <- $rsi
	movq	%rsi, %rax
.Ltmp107:
	#DEBUG_VALUE: operator[]:i <- $rax
	#DEBUG_VALUE: operator[]:this <- $rdi
	.loc	1 23 52 prologue_end            # test2-kec.cpp:23:52
	shlq	$12, %rax
.Ltmp108:
	addq	(%rdi), %rax
	.loc	1 23 44 is_stmt 0               # test2-kec.cpp:23:44
	retq
.Ltmp109:
.Lfunc_end4:
	.size	_ZN7Matrix2ixEm, .Lfunc_end4-_ZN7Matrix2ixEm
	.cfi_endproc
                                        # -- End function
	.type	_ZZ4mainE1a,@object             # @_ZZ4mainE1a
	.local	_ZZ4mainE1a
	.comm	_ZZ4mainE1a,4194304,4
	.type	_ZZ4mainE1b,@object             # @_ZZ4mainE1b
	.local	_ZZ4mainE1b
	.comm	_ZZ4mainE1b,4194304,4
	.type	_ZZ4mainE1c,@object             # @_ZZ4mainE1c
	.local	_ZZ4mainE1c
	.comm	_ZZ4mainE1c,4194304,4
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%f sec\n"
	.size	.L.str, 8

	.type	_ZZ4mainE1a_0,@object           # @_ZZ4mainE1a_0
	.local	_ZZ4mainE1a_0
	.comm	_ZZ4mainE1a_0,8,8
	.type	_ZGVZ4mainE1a_0,@object         # @_ZGVZ4mainE1a_0
	.local	_ZGVZ4mainE1a_0
	.comm	_ZGVZ4mainE1a_0,8,8
	.hidden	__dso_handle
	.type	_ZZ4mainE1b_0,@object           # @_ZZ4mainE1b_0
	.local	_ZZ4mainE1b_0
	.comm	_ZZ4mainE1b_0,8,8
	.type	_ZGVZ4mainE1b_0,@object         # @_ZGVZ4mainE1b_0
	.local	_ZGVZ4mainE1b_0
	.comm	_ZGVZ4mainE1b_0,8,8
	.type	_ZZ4mainE1c_0,@object           # @_ZZ4mainE1c_0
	.local	_ZZ4mainE1c_0
	.comm	_ZZ4mainE1c_0,8,8
	.type	_ZGVZ4mainE1c_0,@object         # @_ZGVZ4mainE1c_0
	.local	_ZGVZ4mainE1c_0
	.comm	_ZGVZ4mainE1c_0,8,8
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp9-.Lfunc_begin0
	.quad	.Ltmp10-.Lfunc_begin0
	.short	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.quad	.Ltmp11-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp11-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	98                              # DW_OP_reg18
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	-1
	.quad	.Lfunc_begin0                   #   base address
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	98                              # DW_OP_reg18
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	-1
	.quad	.Lfunc_begin1                   #   base address
	.quad	.Lfunc_begin1-.Lfunc_begin1
	.quad	.Ltmp96-.Lfunc_begin1
	.short	1                               # Loc expr size
	.byte	84                              # DW_OP_reg4
	.quad	.Ltmp96-.Lfunc_begin1
	.quad	.Lfunc_end1-.Lfunc_begin1
	.short	4                               # Loc expr size
	.byte	243                             # DW_OP_GNU_entry_value
	.byte	1                               # 1
	.byte	84                              # DW_OP_reg4
	.byte	159                             # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	-1
	.quad	.Lfunc_begin2                   #   base address
	.quad	.Lfunc_begin2-.Lfunc_begin2
	.quad	.Ltmp98-.Lfunc_begin2
	.short	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.quad	.Ltmp98-.Lfunc_begin2
	.quad	.Ltmp100-.Lfunc_begin2
	.short	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.quad	.Ltmp100-.Lfunc_begin2
	.quad	.Lfunc_end2-.Lfunc_begin2
	.short	4                               # Loc expr size
	.byte	243                             # DW_OP_GNU_entry_value
	.byte	1                               # 1
	.byte	85                              # DW_OP_reg5
	.byte	159                             # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	-1
	.quad	.Lfunc_begin3                   #   base address
	.quad	.Lfunc_begin3-.Lfunc_begin3
	.quad	.Ltmp103-.Lfunc_begin3
	.short	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.quad	.Ltmp103-.Lfunc_begin3
	.quad	.Lfunc_end3-.Lfunc_begin3
	.short	4                               # Loc expr size
	.byte	243                             # DW_OP_GNU_entry_value
	.byte	1                               # 1
	.byte	85                              # DW_OP_reg5
	.byte	159                             # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	-1
	.quad	.Lfunc_begin4                   #   base address
	.quad	.Lfunc_begin4-.Lfunc_begin4
	.quad	.Ltmp107-.Lfunc_begin4
	.short	1                               # Loc expr size
	.byte	84                              # DW_OP_reg4
	.quad	.Ltmp107-.Lfunc_begin4
	.quad	.Ltmp108-.Lfunc_begin4
	.short	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.quad	0
	.quad	0
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	14                              # DW_FORM_strp
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	14                              # DW_FORM_strp
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	85                              # DW_AT_ranges
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.ascii	"\227B"                         # DW_AT_GNU_all_call_sites
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	23                              # DW_FORM_sec_offset
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	85                              # DW_AT_ranges
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.ascii	"\211\202\001"                  # DW_TAG_GNU_call_site
	.byte	0                               # DW_CHILDREN_no
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.ascii	"\211\202\001"                  # DW_TAG_GNU_call_site
	.byte	1                               # DW_CHILDREN_yes
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.ascii	"\212\202\001"                  # DW_TAG_GNU_call_site_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.ascii	"\221B"                         # DW_AT_GNU_call_site_value
	.byte	24                              # DW_FORM_exprloc
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	2                               # DW_TAG_class_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	54                              # DW_AT_calling_convention
	.byte	11                              # DW_FORM_data1
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	6                               # DW_FORM_data4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	110                             # DW_AT_linkage_name
	.byte	14                              # DW_FORM_strp
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	50                              # DW_AT_accessibility
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	52                              # DW_AT_artificial
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	15                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	16                              # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	17                              # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	18                              # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	19                              # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	20                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	21                              # Abbreviation Code
	.byte	57                              # DW_TAG_namespace
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	22                              # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	23                              # Abbreviation Code
	.byte	8                               # DW_TAG_imported_declaration
	.byte	0                               # DW_CHILDREN_no
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	24                              # DW_AT_import
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	24                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	110                             # DW_AT_linkage_name
	.byte	14                              # DW_FORM_strp
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	25                              # Abbreviation Code
	.byte	2                               # DW_TAG_class_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	54                              # DW_AT_calling_convention
	.byte	11                              # DW_FORM_data1
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	26                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	50                              # DW_AT_accessibility
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	27                              # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	28                              # Abbreviation Code
	.byte	55                              # DW_TAG_restrict_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	29                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	30                              # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	31                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	0                               # DW_CHILDREN_no
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	32                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	54                              # DW_AT_calling_convention
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	33                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.ascii	"\207\001"                      # DW_AT_noreturn
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	34                              # Abbreviation Code
	.byte	21                              # DW_TAG_subroutine_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	35                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	36                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	37                              # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	38                              # Abbreviation Code
	.byte	21                              # DW_TAG_subroutine_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	39                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.ascii	"\207\001"                      # DW_AT_noreturn
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	40                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	41                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	42                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	100                             # DW_AT_object_pointer
	.byte	19                              # DW_FORM_ref4
	.ascii	"\227B"                         # DW_AT_GNU_all_call_sites
	.byte	25                              # DW_FORM_flag_present
	.byte	71                              # DW_AT_specification
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	43                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	52                              # DW_AT_artificial
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	44                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	23                              # DW_FORM_sec_offset
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	45                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	54                              # DW_AT_calling_convention
	.byte	11                              # DW_FORM_data1
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	46                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	100                             # DW_AT_object_pointer
	.byte	19                              # DW_FORM_ref4
	.ascii	"\227B"                         # DW_AT_GNU_all_call_sites
	.byte	25                              # DW_FORM_flag_present
	.byte	110                             # DW_AT_linkage_name
	.byte	14                              # DW_FORM_strp
	.byte	71                              # DW_AT_specification
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	47                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	23                              # DW_FORM_sec_offset
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	52                              # DW_AT_artificial
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                               # DWARF version number
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0xcd8 DW_TAG_compile_unit
	.long	.Linfo_string0                  # DW_AT_producer
	.short	33                              # DW_AT_language
	.long	.Linfo_string1                  # DW_AT_name
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.long	.Linfo_string2                  # DW_AT_comp_dir
	.quad	0                               # DW_AT_low_pc
	.long	.Ldebug_ranges1                 # DW_AT_ranges
	.byte	2                               # Abbrev [2] 0x2a:0x41b DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_GNU_all_call_sites
	.long	.Linfo_string82                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	29                              # DW_AT_decl_line
	.long	1639                            # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x43:0x15 DW_TAG_variable
	.long	.Linfo_string3                  # DW_AT_name
	.long	1093                            # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	32                              # DW_AT_decl_line
	.byte	9                               # DW_AT_location
	.byte	3
	.quad	_ZZ4mainE1a
	.byte	3                               # Abbrev [3] 0x58:0x15 DW_TAG_variable
	.long	.Linfo_string13                 # DW_AT_name
	.long	1093                            # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	33                              # DW_AT_decl_line
	.byte	9                               # DW_AT_location
	.byte	3
	.quad	_ZZ4mainE1b
	.byte	3                               # Abbrev [3] 0x6d:0x15 DW_TAG_variable
	.long	.Linfo_string14                 # DW_AT_name
	.long	1093                            # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	34                              # DW_AT_decl_line
	.byte	9                               # DW_AT_location
	.byte	3
	.quad	_ZZ4mainE1c
	.byte	3                               # Abbrev [3] 0x82:0x15 DW_TAG_variable
	.long	.Linfo_string3                  # DW_AT_name
	.long	1529                            # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	61                              # DW_AT_decl_line
	.byte	9                               # DW_AT_location
	.byte	3
	.quad	_ZZ4mainE1a_0
	.byte	3                               # Abbrev [3] 0x97:0x15 DW_TAG_variable
	.long	.Linfo_string13                 # DW_AT_name
	.long	1529                            # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	62                              # DW_AT_decl_line
	.byte	9                               # DW_AT_location
	.byte	3
	.quad	_ZZ4mainE1b_0
	.byte	3                               # Abbrev [3] 0xac:0x15 DW_TAG_variable
	.long	.Linfo_string14                 # DW_AT_name
	.long	1529                            # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	63                              # DW_AT_decl_line
	.byte	9                               # DW_AT_location
	.byte	3
	.quad	_ZZ4mainE1c_0
	.byte	4                               # Abbrev [4] 0xc1:0xca DW_TAG_lexical_block
	.quad	.Ltmp11                         # DW_AT_low_pc
	.long	.Ltmp43-.Ltmp11                 # DW_AT_high_pc
	.byte	5                               # Abbrev [5] 0xce:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	32
	.long	.Linfo_string85                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	44                              # DW_AT_decl_line
	.long	3100                            # DW_AT_type
	.byte	5                               # Abbrev [5] 0xdc:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	16
	.long	.Linfo_string86                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	44                              # DW_AT_decl_line
	.long	3100                            # DW_AT_type
	.byte	6                               # Abbrev [6] 0xea:0xf DW_TAG_variable
	.long	.Ldebug_loc5                    # DW_AT_location
	.long	.Linfo_string90                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	45                              # DW_AT_decl_line
	.long	1165                            # DW_AT_type
	.byte	4                               # Abbrev [4] 0xf9:0x3a DW_TAG_lexical_block
	.quad	.Ltmp11                         # DW_AT_low_pc
	.long	.Ltmp23-.Ltmp11                 # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x106:0xf DW_TAG_variable
	.long	.Ldebug_loc0                    # DW_AT_location
	.long	.Linfo_string87                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	36                              # DW_AT_decl_line
	.long	1194                            # DW_AT_type
	.byte	4                               # Abbrev [4] 0x115:0x1d DW_TAG_lexical_block
	.quad	.Ltmp11                         # DW_AT_low_pc
	.long	.Ltmp20-.Ltmp11                 # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x122:0xf DW_TAG_variable
	.long	.Ldebug_loc1                    # DW_AT_location
	.long	.Linfo_string88                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	37                              # DW_AT_decl_line
	.long	1194                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	4                               # Abbrev [4] 0x133:0x57 DW_TAG_lexical_block
	.quad	.Ltmp27                         # DW_AT_low_pc
	.long	.Ltmp40-.Ltmp27                 # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x140:0xf DW_TAG_variable
	.long	.Ldebug_loc2                    # DW_AT_location
	.long	.Linfo_string89                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.long	1639                            # DW_AT_type
	.byte	4                               # Abbrev [4] 0x14f:0x3a DW_TAG_lexical_block
	.quad	.Ltmp27                         # DW_AT_low_pc
	.long	.Ltmp37-.Ltmp27                 # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x15c:0xf DW_TAG_variable
	.long	.Ldebug_loc3                    # DW_AT_location
	.long	.Linfo_string87                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	49                              # DW_AT_decl_line
	.long	1639                            # DW_AT_type
	.byte	4                               # Abbrev [4] 0x16b:0x1d DW_TAG_lexical_block
	.quad	.Ltmp27                         # DW_AT_low_pc
	.long	.Ltmp34-.Ltmp27                 # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x178:0xf DW_TAG_variable
	.long	.Ldebug_loc4                    # DW_AT_location
	.long	.Linfo_string88                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	50                              # DW_AT_decl_line
	.long	1639                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x18b:0xc2 DW_TAG_lexical_block
	.long	.Ldebug_ranges0                 # DW_AT_ranges
	.byte	5                               # Abbrev [5] 0x190:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	32
	.long	.Linfo_string85                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	73                              # DW_AT_decl_line
	.long	3100                            # DW_AT_type
	.byte	5                               # Abbrev [5] 0x19e:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	16
	.long	.Linfo_string86                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	73                              # DW_AT_decl_line
	.long	3100                            # DW_AT_type
	.byte	6                               # Abbrev [6] 0x1ac:0xf DW_TAG_variable
	.long	.Ldebug_loc11                   # DW_AT_location
	.long	.Linfo_string90                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	74                              # DW_AT_decl_line
	.long	1165                            # DW_AT_type
	.byte	4                               # Abbrev [4] 0x1bb:0x3a DW_TAG_lexical_block
	.quad	.Ltmp44                         # DW_AT_low_pc
	.long	.Ltmp56-.Ltmp44                 # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x1c8:0xf DW_TAG_variable
	.long	.Ldebug_loc7                    # DW_AT_location
	.long	.Linfo_string87                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	65                              # DW_AT_decl_line
	.long	1194                            # DW_AT_type
	.byte	4                               # Abbrev [4] 0x1d7:0x1d DW_TAG_lexical_block
	.quad	.Ltmp44                         # DW_AT_low_pc
	.long	.Ltmp53-.Ltmp44                 # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x1e4:0xf DW_TAG_variable
	.long	.Ldebug_loc6                    # DW_AT_location
	.long	.Linfo_string88                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	66                              # DW_AT_decl_line
	.long	1194                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	4                               # Abbrev [4] 0x1f5:0x57 DW_TAG_lexical_block
	.quad	.Ltmp60                         # DW_AT_low_pc
	.long	.Ltmp73-.Ltmp60                 # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x202:0xf DW_TAG_variable
	.long	.Ldebug_loc8                    # DW_AT_location
	.long	.Linfo_string89                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	77                              # DW_AT_decl_line
	.long	1639                            # DW_AT_type
	.byte	4                               # Abbrev [4] 0x211:0x3a DW_TAG_lexical_block
	.quad	.Ltmp60                         # DW_AT_low_pc
	.long	.Ltmp70-.Ltmp60                 # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x21e:0xf DW_TAG_variable
	.long	.Ldebug_loc9                    # DW_AT_location
	.long	.Linfo_string87                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	78                              # DW_AT_decl_line
	.long	1639                            # DW_AT_type
	.byte	4                               # Abbrev [4] 0x22d:0x1d DW_TAG_lexical_block
	.quad	.Ltmp60                         # DW_AT_low_pc
	.long	.Ltmp67-.Ltmp60                 # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x23a:0xf DW_TAG_variable
	.long	.Ldebug_loc10                   # DW_AT_location
	.long	.Linfo_string88                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	79                              # DW_AT_decl_line
	.long	1639                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x24d:0xd DW_TAG_GNU_call_site
	.long	3011                            # DW_AT_abstract_origin
	.quad	.Ltmp12                         # DW_AT_low_pc
	.byte	9                               # Abbrev [9] 0x25a:0x1a DW_TAG_GNU_call_site
	.long	3023                            # DW_AT_abstract_origin
	.quad	.Ltmp13                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x267:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	125
	.byte	0
	.byte	10                              # Abbrev [10] 0x26d:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	126
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x274:0xd DW_TAG_GNU_call_site
	.long	3011                            # DW_AT_abstract_origin
	.quad	.Ltmp14                         # DW_AT_low_pc
	.byte	9                               # Abbrev [9] 0x281:0x1a DW_TAG_GNU_call_site
	.long	3023                            # DW_AT_abstract_origin
	.quad	.Ltmp15                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x28e:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	125
	.byte	0
	.byte	10                              # Abbrev [10] 0x294:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	127
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x29b:0x1a DW_TAG_GNU_call_site
	.long	3023                            # DW_AT_abstract_origin
	.quad	.Ltmp16                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x2a8:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	125
	.byte	0
	.byte	10                              # Abbrev [10] 0x2ae:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	124
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x2b5:0x19 DW_TAG_GNU_call_site
	.long	3073                            # DW_AT_abstract_origin
	.quad	.Ltmp24                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x2c2:0x5 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	1                               # DW_AT_GNU_call_site_value
	.byte	48
	.byte	10                              # Abbrev [10] 0x2c7:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	145
	.byte	32
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x2ce:0x1a DW_TAG_GNU_call_site
	.long	3023                            # DW_AT_abstract_origin
	.quad	.Ltmp28                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x2db:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	115
	.byte	0
	.byte	10                              # Abbrev [10] 0x2e1:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	126
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x2e8:0x1a DW_TAG_GNU_call_site
	.long	3023                            # DW_AT_abstract_origin
	.quad	.Ltmp29                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x2f5:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	125
	.byte	0
	.byte	10                              # Abbrev [10] 0x2fb:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	127
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x302:0x1a DW_TAG_GNU_call_site
	.long	3023                            # DW_AT_abstract_origin
	.quad	.Ltmp30                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x30f:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	115
	.byte	0
	.byte	10                              # Abbrev [10] 0x315:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	124
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x31c:0x19 DW_TAG_GNU_call_site
	.long	3073                            # DW_AT_abstract_origin
	.quad	.Ltmp41                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x329:0x5 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	1                               # DW_AT_GNU_call_site_value
	.byte	48
	.byte	10                              # Abbrev [10] 0x32e:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	145
	.byte	16
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x335:0xd DW_TAG_GNU_call_site
	.long	3011                            # DW_AT_abstract_origin
	.quad	.Ltmp45                         # DW_AT_low_pc
	.byte	9                               # Abbrev [9] 0x342:0x1a DW_TAG_GNU_call_site
	.long	3156                            # DW_AT_abstract_origin
	.quad	.Ltmp46                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x34f:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	125
	.byte	0
	.byte	10                              # Abbrev [10] 0x355:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	126
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x35c:0xd DW_TAG_GNU_call_site
	.long	3011                            # DW_AT_abstract_origin
	.quad	.Ltmp47                         # DW_AT_low_pc
	.byte	9                               # Abbrev [9] 0x369:0x1a DW_TAG_GNU_call_site
	.long	3156                            # DW_AT_abstract_origin
	.quad	.Ltmp48                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x376:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	125
	.byte	0
	.byte	10                              # Abbrev [10] 0x37c:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	127
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x383:0x1a DW_TAG_GNU_call_site
	.long	3156                            # DW_AT_abstract_origin
	.quad	.Ltmp49                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x390:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	125
	.byte	0
	.byte	10                              # Abbrev [10] 0x396:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	124
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x39d:0x19 DW_TAG_GNU_call_site
	.long	3073                            # DW_AT_abstract_origin
	.quad	.Ltmp57                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x3aa:0x5 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	1                               # DW_AT_GNU_call_site_value
	.byte	48
	.byte	10                              # Abbrev [10] 0x3af:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	145
	.byte	32
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x3b6:0x1a DW_TAG_GNU_call_site
	.long	3156                            # DW_AT_abstract_origin
	.quad	.Ltmp61                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x3c3:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	115
	.byte	0
	.byte	10                              # Abbrev [10] 0x3c9:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	126
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x3d0:0x1a DW_TAG_GNU_call_site
	.long	3156                            # DW_AT_abstract_origin
	.quad	.Ltmp62                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x3dd:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	125
	.byte	0
	.byte	10                              # Abbrev [10] 0x3e3:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	127
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x3ea:0x1a DW_TAG_GNU_call_site
	.long	3156                            # DW_AT_abstract_origin
	.quad	.Ltmp63                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x3f7:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	115
	.byte	0
	.byte	10                              # Abbrev [10] 0x3fd:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	124
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x404:0x19 DW_TAG_GNU_call_site
	.long	3073                            # DW_AT_abstract_origin
	.quad	.Ltmp74                         # DW_AT_low_pc
	.byte	10                              # Abbrev [10] 0x411:0x5 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	1                               # DW_AT_GNU_call_site_value
	.byte	48
	.byte	10                              # Abbrev [10] 0x416:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	145
	.byte	16
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x41d:0xd DW_TAG_GNU_call_site
	.long	3206                            # DW_AT_abstract_origin
	.quad	.Ltmp80                         # DW_AT_low_pc
	.byte	8                               # Abbrev [8] 0x42a:0xd DW_TAG_GNU_call_site
	.long	3206                            # DW_AT_abstract_origin
	.quad	.Ltmp84                         # DW_AT_low_pc
	.byte	8                               # Abbrev [8] 0x437:0xd DW_TAG_GNU_call_site
	.long	3206                            # DW_AT_abstract_origin
	.quad	.Ltmp88                         # DW_AT_low_pc
	.byte	0                               # End Of Children Mark
	.byte	11                              # Abbrev [11] 0x445:0x34 DW_TAG_class_type
	.byte	5                               # DW_AT_calling_convention
	.long	.Linfo_string12                 # DW_AT_name
	.long	4194304                         # DW_AT_byte_size
	.byte	1                               # DW_AT_decl_file
	.byte	12                              # DW_AT_decl_line
	.byte	12                              # Abbrev [12] 0x451:0xc DW_TAG_member
	.long	.Linfo_string4                  # DW_AT_name
	.long	1145                            # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	13                              # Abbrev [13] 0x45d:0x1b DW_TAG_subprogram
	.long	.Linfo_string7                  # DW_AT_linkage_name
	.long	.Linfo_string8                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.long	1179                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	1                               # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	14                              # Abbrev [14] 0x46d:0x5 DW_TAG_formal_parameter
	.long	1184                            # DW_AT_type
                                        # DW_AT_artificial
	.byte	15                              # Abbrev [15] 0x472:0x5 DW_TAG_formal_parameter
	.long	1194                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	16                              # Abbrev [16] 0x479:0x14 DW_TAG_array_type
	.long	1165                            # DW_AT_type
	.byte	17                              # Abbrev [17] 0x47e:0x7 DW_TAG_subrange_type
	.long	1172                            # DW_AT_type
	.short	1024                            # DW_AT_count
	.byte	17                              # Abbrev [17] 0x485:0x7 DW_TAG_subrange_type
	.long	1172                            # DW_AT_type
	.short	1024                            # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0x48d:0x7 DW_TAG_base_type
	.long	.Linfo_string5                  # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	19                              # Abbrev [19] 0x494:0x7 DW_TAG_base_type
	.long	.Linfo_string6                  # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	20                              # Abbrev [20] 0x49b:0x5 DW_TAG_pointer_type
	.long	1165                            # DW_AT_type
	.byte	20                              # Abbrev [20] 0x4a0:0x5 DW_TAG_pointer_type
	.long	1093                            # DW_AT_type
	.byte	21                              # Abbrev [21] 0x4a5:0x14d DW_TAG_namespace
	.long	.Linfo_string9                  # DW_AT_name
	.byte	22                              # Abbrev [22] 0x4aa:0xc DW_TAG_typedef
	.long	1522                            # DW_AT_type
	.long	.Linfo_string11                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.short	260                             # DW_AT_decl_line
	.byte	23                              # Abbrev [23] 0x4b6:0x7 DW_TAG_imported_declaration
	.byte	4                               # DW_AT_decl_file
	.byte	52                              # DW_AT_decl_line
	.long	1621                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x4bd:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	127                             # DW_AT_decl_line
	.long	1646                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x4c4:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	128                             # DW_AT_decl_line
	.long	1658                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x4cb:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	130                             # DW_AT_decl_line
	.long	1706                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x4d2:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	134                             # DW_AT_decl_line
	.long	1714                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x4d9:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	137                             # DW_AT_decl_line
	.long	1738                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x4e0:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	140                             # DW_AT_decl_line
	.long	1756                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x4e7:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	141                             # DW_AT_decl_line
	.long	1797                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x4ee:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	142                             # DW_AT_decl_line
	.long	1815                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x4f5:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	143                             # DW_AT_decl_line
	.long	1833                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x4fc:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	144                             # DW_AT_decl_line
	.long	1921                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x503:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	145                             # DW_AT_decl_line
	.long	1944                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x50a:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	146                             # DW_AT_decl_line
	.long	1967                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x511:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	147                             # DW_AT_decl_line
	.long	1981                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x518:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	148                             # DW_AT_decl_line
	.long	1995                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x51f:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	149                             # DW_AT_decl_line
	.long	2018                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x526:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	150                             # DW_AT_decl_line
	.long	2036                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x52d:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	151                             # DW_AT_decl_line
	.long	2059                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x534:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	153                             # DW_AT_decl_line
	.long	2077                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x53b:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	154                             # DW_AT_decl_line
	.long	2100                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x542:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	155                             # DW_AT_decl_line
	.long	2150                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x549:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	157                             # DW_AT_decl_line
	.long	2178                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x550:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	160                             # DW_AT_decl_line
	.long	2207                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x557:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	163                             # DW_AT_decl_line
	.long	2221                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x55e:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	164                             # DW_AT_decl_line
	.long	2233                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x565:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	165                             # DW_AT_decl_line
	.long	2256                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x56c:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	166                             # DW_AT_decl_line
	.long	2277                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x573:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	167                             # DW_AT_decl_line
	.long	2309                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x57a:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	168                             # DW_AT_decl_line
	.long	2336                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x581:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	169                             # DW_AT_decl_line
	.long	2363                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x588:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	171                             # DW_AT_decl_line
	.long	2381                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x58f:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	172                             # DW_AT_decl_line
	.long	2429                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x596:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	240                             # DW_AT_decl_line
	.long	2547                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x59d:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	242                             # DW_AT_decl_line
	.long	2595                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x5a4:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	244                             # DW_AT_decl_line
	.long	2609                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x5ab:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	245                             # DW_AT_decl_line
	.long	2520                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x5b2:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	246                             # DW_AT_decl_line
	.long	2627                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x5b9:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	248                             # DW_AT_decl_line
	.long	2650                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x5c0:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	249                             # DW_AT_decl_line
	.long	2729                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x5c7:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	250                             # DW_AT_decl_line
	.long	2668                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x5ce:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	251                             # DW_AT_decl_line
	.long	2695                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x5d5:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	252                             # DW_AT_decl_line
	.long	2751                            # DW_AT_import
	.byte	24                              # Abbrev [24] 0x5dc:0x15 DW_TAG_subprogram
	.long	.Linfo_string73                 # DW_AT_linkage_name
	.long	.Linfo_string18                 # DW_AT_name
	.byte	4                               # DW_AT_decl_file
	.byte	103                             # DW_AT_decl_line
	.long	2829                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x5eb:0x5 DW_TAG_formal_parameter
	.long	2829                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0x5f2:0x7 DW_TAG_base_type
	.long	.Linfo_string10                 # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	25                              # Abbrev [25] 0x5f9:0x4d DW_TAG_class_type
	.byte	4                               # DW_AT_calling_convention
	.long	.Linfo_string15                 # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	1                               # DW_AT_decl_file
	.byte	19                              # DW_AT_decl_line
	.byte	12                              # Abbrev [12] 0x602:0xc DW_TAG_member
	.long	.Linfo_string4                  # DW_AT_name
	.long	1606                            # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	25                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	26                              # Abbrev [26] 0x60e:0xe DW_TAG_subprogram
	.long	.Linfo_string15                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	21                              # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	1                               # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	14                              # Abbrev [14] 0x616:0x5 DW_TAG_formal_parameter
	.long	1616                            # DW_AT_type
                                        # DW_AT_artificial
	.byte	0                               # End Of Children Mark
	.byte	26                              # Abbrev [26] 0x61c:0xe DW_TAG_subprogram
	.long	.Linfo_string16                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	22                              # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	1                               # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	14                              # Abbrev [14] 0x624:0x5 DW_TAG_formal_parameter
	.long	1616                            # DW_AT_type
                                        # DW_AT_artificial
	.byte	0                               # End Of Children Mark
	.byte	13                              # Abbrev [13] 0x62a:0x1b DW_TAG_subprogram
	.long	.Linfo_string17                 # DW_AT_linkage_name
	.long	.Linfo_string8                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	23                              # DW_AT_decl_line
	.long	1179                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	1                               # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	14                              # Abbrev [14] 0x63a:0x5 DW_TAG_formal_parameter
	.long	1616                            # DW_AT_type
                                        # DW_AT_artificial
	.byte	15                              # Abbrev [15] 0x63f:0x5 DW_TAG_formal_parameter
	.long	1194                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	27                              # Abbrev [27] 0x646:0x5 DW_TAG_const_type
	.long	1611                            # DW_AT_type
	.byte	28                              # Abbrev [28] 0x64b:0x5 DW_TAG_restrict_type
	.long	1179                            # DW_AT_type
	.byte	20                              # Abbrev [20] 0x650:0x5 DW_TAG_pointer_type
	.long	1529                            # DW_AT_type
	.byte	29                              # Abbrev [29] 0x655:0x12 DW_TAG_subprogram
	.long	.Linfo_string18                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	840                             # DW_AT_decl_line
	.long	1639                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x661:0x5 DW_TAG_formal_parameter
	.long	1639                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0x667:0x7 DW_TAG_base_type
	.long	.Linfo_string19                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	30                              # Abbrev [30] 0x66e:0xb DW_TAG_typedef
	.long	1657                            # DW_AT_type
	.long	.Linfo_string20                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	62                              # DW_AT_decl_line
	.byte	31                              # Abbrev [31] 0x679:0x1 DW_TAG_structure_type
                                        # DW_AT_declaration
	.byte	30                              # Abbrev [30] 0x67a:0xb DW_TAG_typedef
	.long	1669                            # DW_AT_type
	.long	.Linfo_string24                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	70                              # DW_AT_decl_line
	.byte	32                              # Abbrev [32] 0x685:0x1e DW_TAG_structure_type
	.byte	5                               # DW_AT_calling_convention
	.byte	16                              # DW_AT_byte_size
	.byte	3                               # DW_AT_decl_file
	.byte	66                              # DW_AT_decl_line
	.byte	12                              # Abbrev [12] 0x68a:0xc DW_TAG_member
	.long	.Linfo_string21                 # DW_AT_name
	.long	1699                            # DW_AT_type
	.byte	3                               # DW_AT_decl_file
	.byte	68                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	12                              # Abbrev [12] 0x696:0xc DW_TAG_member
	.long	.Linfo_string23                 # DW_AT_name
	.long	1699                            # DW_AT_type
	.byte	3                               # DW_AT_decl_file
	.byte	69                              # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0x6a3:0x7 DW_TAG_base_type
	.long	.Linfo_string22                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	33                              # Abbrev [33] 0x6aa:0x8 DW_TAG_subprogram
	.long	.Linfo_string25                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	591                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
                                        # DW_AT_noreturn
	.byte	29                              # Abbrev [29] 0x6b2:0x12 DW_TAG_subprogram
	.long	.Linfo_string26                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	595                             # DW_AT_decl_line
	.long	1639                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x6be:0x5 DW_TAG_formal_parameter
	.long	1732                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	20                              # Abbrev [20] 0x6c4:0x5 DW_TAG_pointer_type
	.long	1737                            # DW_AT_type
	.byte	34                              # Abbrev [34] 0x6c9:0x1 DW_TAG_subroutine_type
	.byte	29                              # Abbrev [29] 0x6ca:0x12 DW_TAG_subprogram
	.long	.Linfo_string27                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	600                             # DW_AT_decl_line
	.long	1639                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x6d6:0x5 DW_TAG_formal_parameter
	.long	1732                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	35                              # Abbrev [35] 0x6dc:0x11 DW_TAG_subprogram
	.long	.Linfo_string28                 # DW_AT_name
	.byte	6                               # DW_AT_decl_file
	.byte	25                              # DW_AT_decl_line
	.long	1773                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x6e7:0x5 DW_TAG_formal_parameter
	.long	1780                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0x6ed:0x7 DW_TAG_base_type
	.long	.Linfo_string29                 # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	20                              # Abbrev [20] 0x6f4:0x5 DW_TAG_pointer_type
	.long	1785                            # DW_AT_type
	.byte	27                              # Abbrev [27] 0x6f9:0x5 DW_TAG_const_type
	.long	1790                            # DW_AT_type
	.byte	18                              # Abbrev [18] 0x6fe:0x7 DW_TAG_base_type
	.long	.Linfo_string30                 # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	29                              # Abbrev [29] 0x705:0x12 DW_TAG_subprogram
	.long	.Linfo_string31                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	361                             # DW_AT_decl_line
	.long	1639                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x711:0x5 DW_TAG_formal_parameter
	.long	1780                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0x717:0x12 DW_TAG_subprogram
	.long	.Linfo_string32                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	366                             # DW_AT_decl_line
	.long	1699                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x723:0x5 DW_TAG_formal_parameter
	.long	1780                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	35                              # Abbrev [35] 0x729:0x25 DW_TAG_subprogram
	.long	.Linfo_string33                 # DW_AT_name
	.byte	7                               # DW_AT_decl_file
	.byte	20                              # DW_AT_decl_line
	.long	1870                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x734:0x5 DW_TAG_formal_parameter
	.long	1871                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x739:0x5 DW_TAG_formal_parameter
	.long	1871                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x73e:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x743:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x748:0x5 DW_TAG_formal_parameter
	.long	1888                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	36                              # Abbrev [36] 0x74e:0x1 DW_TAG_pointer_type
	.byte	20                              # Abbrev [20] 0x74f:0x5 DW_TAG_pointer_type
	.long	1876                            # DW_AT_type
	.byte	37                              # Abbrev [37] 0x754:0x1 DW_TAG_const_type
	.byte	30                              # Abbrev [30] 0x755:0xb DW_TAG_typedef
	.long	1522                            # DW_AT_type
	.long	.Linfo_string11                 # DW_AT_name
	.byte	8                               # DW_AT_decl_file
	.byte	46                              # DW_AT_decl_line
	.byte	22                              # Abbrev [22] 0x760:0xc DW_TAG_typedef
	.long	1900                            # DW_AT_type
	.long	.Linfo_string34                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	808                             # DW_AT_decl_line
	.byte	20                              # Abbrev [20] 0x76c:0x5 DW_TAG_pointer_type
	.long	1905                            # DW_AT_type
	.byte	38                              # Abbrev [38] 0x771:0x10 DW_TAG_subroutine_type
	.long	1639                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x776:0x5 DW_TAG_formal_parameter
	.long	1871                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x77b:0x5 DW_TAG_formal_parameter
	.long	1871                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0x781:0x17 DW_TAG_subprogram
	.long	.Linfo_string35                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	542                             # DW_AT_decl_line
	.long	1870                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x78d:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x792:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0x798:0x17 DW_TAG_subprogram
	.long	.Linfo_string36                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	852                             # DW_AT_decl_line
	.long	1646                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x7a4:0x5 DW_TAG_formal_parameter
	.long	1639                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x7a9:0x5 DW_TAG_formal_parameter
	.long	1639                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	39                              # Abbrev [39] 0x7af:0xe DW_TAG_subprogram
	.long	.Linfo_string37                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	617                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
                                        # DW_AT_noreturn
	.byte	15                              # Abbrev [15] 0x7b7:0x5 DW_TAG_formal_parameter
	.long	1639                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	40                              # Abbrev [40] 0x7bd:0xe DW_TAG_subprogram
	.long	.Linfo_string38                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	565                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x7c5:0x5 DW_TAG_formal_parameter
	.long	1870                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0x7cb:0x12 DW_TAG_subprogram
	.long	.Linfo_string39                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	634                             # DW_AT_decl_line
	.long	2013                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x7d7:0x5 DW_TAG_formal_parameter
	.long	1780                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	20                              # Abbrev [20] 0x7dd:0x5 DW_TAG_pointer_type
	.long	1790                            # DW_AT_type
	.byte	29                              # Abbrev [29] 0x7e2:0x12 DW_TAG_subprogram
	.long	.Linfo_string40                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	841                             # DW_AT_decl_line
	.long	1699                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x7ee:0x5 DW_TAG_formal_parameter
	.long	1699                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0x7f4:0x17 DW_TAG_subprogram
	.long	.Linfo_string41                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	854                             # DW_AT_decl_line
	.long	1658                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x800:0x5 DW_TAG_formal_parameter
	.long	1699                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x805:0x5 DW_TAG_formal_parameter
	.long	1699                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0x80b:0x12 DW_TAG_subprogram
	.long	.Linfo_string42                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	539                             # DW_AT_decl_line
	.long	1870                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x817:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0x81d:0x17 DW_TAG_subprogram
	.long	.Linfo_string43                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	922                             # DW_AT_decl_line
	.long	1639                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x829:0x5 DW_TAG_formal_parameter
	.long	1780                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x82e:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0x834:0x1c DW_TAG_subprogram
	.long	.Linfo_string44                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	933                             # DW_AT_decl_line
	.long	1877                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x840:0x5 DW_TAG_formal_parameter
	.long	2128                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x845:0x5 DW_TAG_formal_parameter
	.long	2145                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x84a:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	28                              # Abbrev [28] 0x850:0x5 DW_TAG_restrict_type
	.long	2133                            # DW_AT_type
	.byte	20                              # Abbrev [20] 0x855:0x5 DW_TAG_pointer_type
	.long	2138                            # DW_AT_type
	.byte	18                              # Abbrev [18] 0x85a:0x7 DW_TAG_base_type
	.long	.Linfo_string45                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	28                              # Abbrev [28] 0x861:0x5 DW_TAG_restrict_type
	.long	1780                            # DW_AT_type
	.byte	29                              # Abbrev [29] 0x866:0x1c DW_TAG_subprogram
	.long	.Linfo_string46                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	925                             # DW_AT_decl_line
	.long	1639                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x872:0x5 DW_TAG_formal_parameter
	.long	2128                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x877:0x5 DW_TAG_formal_parameter
	.long	2145                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x87c:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	40                              # Abbrev [40] 0x882:0x1d DW_TAG_subprogram
	.long	.Linfo_string47                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	830                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x88a:0x5 DW_TAG_formal_parameter
	.long	1870                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x88f:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x894:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x899:0x5 DW_TAG_formal_parameter
	.long	1888                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	39                              # Abbrev [39] 0x89f:0xe DW_TAG_subprogram
	.long	.Linfo_string48                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	623                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
                                        # DW_AT_noreturn
	.byte	15                              # Abbrev [15] 0x8a7:0x5 DW_TAG_formal_parameter
	.long	1639                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	41                              # Abbrev [41] 0x8ad:0xc DW_TAG_subprogram
	.long	.Linfo_string49                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	453                             # DW_AT_decl_line
	.long	1639                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	29                              # Abbrev [29] 0x8b9:0x17 DW_TAG_subprogram
	.long	.Linfo_string50                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	550                             # DW_AT_decl_line
	.long	1870                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x8c5:0x5 DW_TAG_formal_parameter
	.long	1870                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x8ca:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	40                              # Abbrev [40] 0x8d0:0xe DW_TAG_subprogram
	.long	.Linfo_string51                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	455                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x8d8:0x5 DW_TAG_formal_parameter
	.long	2270                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0x8de:0x7 DW_TAG_base_type
	.long	.Linfo_string52                 # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	35                              # Abbrev [35] 0x8e5:0x16 DW_TAG_subprogram
	.long	.Linfo_string53                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	117                             # DW_AT_decl_line
	.long	1773                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x8f0:0x5 DW_TAG_formal_parameter
	.long	2145                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x8f5:0x5 DW_TAG_formal_parameter
	.long	2299                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	28                              # Abbrev [28] 0x8fb:0x5 DW_TAG_restrict_type
	.long	2304                            # DW_AT_type
	.byte	20                              # Abbrev [20] 0x900:0x5 DW_TAG_pointer_type
	.long	2013                            # DW_AT_type
	.byte	35                              # Abbrev [35] 0x905:0x1b DW_TAG_subprogram
	.long	.Linfo_string54                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	176                             # DW_AT_decl_line
	.long	1699                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x910:0x5 DW_TAG_formal_parameter
	.long	2145                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x915:0x5 DW_TAG_formal_parameter
	.long	2299                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x91a:0x5 DW_TAG_formal_parameter
	.long	1639                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	35                              # Abbrev [35] 0x920:0x1b DW_TAG_subprogram
	.long	.Linfo_string55                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	180                             # DW_AT_decl_line
	.long	1522                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x92b:0x5 DW_TAG_formal_parameter
	.long	2145                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x930:0x5 DW_TAG_formal_parameter
	.long	2299                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x935:0x5 DW_TAG_formal_parameter
	.long	1639                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0x93b:0x12 DW_TAG_subprogram
	.long	.Linfo_string56                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	784                             # DW_AT_decl_line
	.long	1639                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x947:0x5 DW_TAG_formal_parameter
	.long	1780                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0x94d:0x1c DW_TAG_subprogram
	.long	.Linfo_string57                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	937                             # DW_AT_decl_line
	.long	1877                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x959:0x5 DW_TAG_formal_parameter
	.long	2409                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x95e:0x5 DW_TAG_formal_parameter
	.long	2414                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x963:0x5 DW_TAG_formal_parameter
	.long	1877                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	28                              # Abbrev [28] 0x969:0x5 DW_TAG_restrict_type
	.long	2013                            # DW_AT_type
	.byte	28                              # Abbrev [28] 0x96e:0x5 DW_TAG_restrict_type
	.long	2419                            # DW_AT_type
	.byte	20                              # Abbrev [20] 0x973:0x5 DW_TAG_pointer_type
	.long	2424                            # DW_AT_type
	.byte	27                              # Abbrev [27] 0x978:0x5 DW_TAG_const_type
	.long	2138                            # DW_AT_type
	.byte	29                              # Abbrev [29] 0x97d:0x17 DW_TAG_subprogram
	.long	.Linfo_string58                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	929                             # DW_AT_decl_line
	.long	1639                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x989:0x5 DW_TAG_formal_parameter
	.long	2013                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x98e:0x5 DW_TAG_formal_parameter
	.long	2138                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	21                              # Abbrev [21] 0x994:0x5f DW_TAG_namespace
	.long	.Linfo_string59                 # DW_AT_name
	.byte	23                              # Abbrev [23] 0x999:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	200                             # DW_AT_decl_line
	.long	2547                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x9a0:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	206                             # DW_AT_decl_line
	.long	2595                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x9a7:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	210                             # DW_AT_decl_line
	.long	2609                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x9ae:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	216                             # DW_AT_decl_line
	.long	2627                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x9b5:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	227                             # DW_AT_decl_line
	.long	2650                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x9bc:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	228                             # DW_AT_decl_line
	.long	2668                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x9c3:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	229                             # DW_AT_decl_line
	.long	2695                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x9ca:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	231                             # DW_AT_decl_line
	.long	2729                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0x9d1:0x7 DW_TAG_imported_declaration
	.byte	5                               # DW_AT_decl_file
	.byte	232                             # DW_AT_decl_line
	.long	2751                            # DW_AT_import
	.byte	24                              # Abbrev [24] 0x9d8:0x1a DW_TAG_subprogram
	.long	.Linfo_string72                 # DW_AT_linkage_name
	.long	.Linfo_string36                 # DW_AT_name
	.byte	5                               # DW_AT_decl_file
	.byte	213                             # DW_AT_decl_line
	.long	2547                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0x9e7:0x5 DW_TAG_formal_parameter
	.long	2588                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0x9ec:0x5 DW_TAG_formal_parameter
	.long	2588                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	30                              # Abbrev [30] 0x9f3:0xb DW_TAG_typedef
	.long	2558                            # DW_AT_type
	.long	.Linfo_string61                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	80                              # DW_AT_decl_line
	.byte	32                              # Abbrev [32] 0x9fe:0x1e DW_TAG_structure_type
	.byte	5                               # DW_AT_calling_convention
	.byte	16                              # DW_AT_byte_size
	.byte	3                               # DW_AT_decl_file
	.byte	76                              # DW_AT_decl_line
	.byte	12                              # Abbrev [12] 0xa03:0xc DW_TAG_member
	.long	.Linfo_string21                 # DW_AT_name
	.long	2588                            # DW_AT_type
	.byte	3                               # DW_AT_decl_file
	.byte	78                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	12                              # Abbrev [12] 0xa0f:0xc DW_TAG_member
	.long	.Linfo_string23                 # DW_AT_name
	.long	2588                            # DW_AT_type
	.byte	3                               # DW_AT_decl_file
	.byte	79                              # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0xa1c:0x7 DW_TAG_base_type
	.long	.Linfo_string60                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	39                              # Abbrev [39] 0xa23:0xe DW_TAG_subprogram
	.long	.Linfo_string62                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	629                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
                                        # DW_AT_noreturn
	.byte	15                              # Abbrev [15] 0xa2b:0x5 DW_TAG_formal_parameter
	.long	1639                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0xa31:0x12 DW_TAG_subprogram
	.long	.Linfo_string63                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	844                             # DW_AT_decl_line
	.long	2588                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0xa3d:0x5 DW_TAG_formal_parameter
	.long	2588                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0xa43:0x17 DW_TAG_subprogram
	.long	.Linfo_string64                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	858                             # DW_AT_decl_line
	.long	2547                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0xa4f:0x5 DW_TAG_formal_parameter
	.long	2588                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0xa54:0x5 DW_TAG_formal_parameter
	.long	2588                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0xa5a:0x12 DW_TAG_subprogram
	.long	.Linfo_string65                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	373                             # DW_AT_decl_line
	.long	2588                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0xa66:0x5 DW_TAG_formal_parameter
	.long	1780                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	35                              # Abbrev [35] 0xa6c:0x1b DW_TAG_subprogram
	.long	.Linfo_string66                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	200                             # DW_AT_decl_line
	.long	2588                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0xa77:0x5 DW_TAG_formal_parameter
	.long	2145                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0xa7c:0x5 DW_TAG_formal_parameter
	.long	2299                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0xa81:0x5 DW_TAG_formal_parameter
	.long	1639                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	35                              # Abbrev [35] 0xa87:0x1b DW_TAG_subprogram
	.long	.Linfo_string67                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	205                             # DW_AT_decl_line
	.long	2722                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0xa92:0x5 DW_TAG_formal_parameter
	.long	2145                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0xa97:0x5 DW_TAG_formal_parameter
	.long	2299                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0xa9c:0x5 DW_TAG_formal_parameter
	.long	1639                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0xaa2:0x7 DW_TAG_base_type
	.long	.Linfo_string68                 # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	35                              # Abbrev [35] 0xaa9:0x16 DW_TAG_subprogram
	.long	.Linfo_string69                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	123                             # DW_AT_decl_line
	.long	1165                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0xab4:0x5 DW_TAG_formal_parameter
	.long	2145                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0xab9:0x5 DW_TAG_formal_parameter
	.long	2299                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	35                              # Abbrev [35] 0xabf:0x16 DW_TAG_subprogram
	.long	.Linfo_string70                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	126                             # DW_AT_decl_line
	.long	2773                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0xaca:0x5 DW_TAG_formal_parameter
	.long	2145                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0xacf:0x5 DW_TAG_formal_parameter
	.long	2299                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0xad5:0x7 DW_TAG_base_type
	.long	.Linfo_string71                 # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	16                              # DW_AT_byte_size
	.byte	23                              # Abbrev [23] 0xadc:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	38                              # DW_AT_decl_line
	.long	1706                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xae3:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	39                              # DW_AT_decl_line
	.long	1714                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xaea:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	40                              # DW_AT_decl_line
	.long	1967                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xaf1:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	43                              # DW_AT_decl_line
	.long	1738                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xaf8:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	46                              # DW_AT_decl_line
	.long	2207                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xaff:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	51                              # DW_AT_decl_line
	.long	1646                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb06:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	52                              # DW_AT_decl_line
	.long	1658                            # DW_AT_import
	.byte	18                              # Abbrev [18] 0xb0d:0x7 DW_TAG_base_type
	.long	.Linfo_string74                 # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	16                              # DW_AT_byte_size
	.byte	23                              # Abbrev [23] 0xb14:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	54                              # DW_AT_decl_line
	.long	1500                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb1b:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	55                              # DW_AT_decl_line
	.long	1756                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb22:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	56                              # DW_AT_decl_line
	.long	1797                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb29:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	57                              # DW_AT_decl_line
	.long	1815                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb30:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	58                              # DW_AT_decl_line
	.long	1833                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb37:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	59                              # DW_AT_decl_line
	.long	1921                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb3e:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	60                              # DW_AT_decl_line
	.long	2520                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb45:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	61                              # DW_AT_decl_line
	.long	1981                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb4c:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	62                              # DW_AT_decl_line
	.long	1995                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb53:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	63                              # DW_AT_decl_line
	.long	2018                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb5a:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	64                              # DW_AT_decl_line
	.long	2036                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb61:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	65                              # DW_AT_decl_line
	.long	2059                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb68:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	67                              # DW_AT_decl_line
	.long	2077                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb6f:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	68                              # DW_AT_decl_line
	.long	2100                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb76:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	69                              # DW_AT_decl_line
	.long	2150                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb7d:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	71                              # DW_AT_decl_line
	.long	2178                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb84:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	72                              # DW_AT_decl_line
	.long	2221                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb8b:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	73                              # DW_AT_decl_line
	.long	2233                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb92:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	74                              # DW_AT_decl_line
	.long	2256                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xb99:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	75                              # DW_AT_decl_line
	.long	2277                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xba0:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	76                              # DW_AT_decl_line
	.long	2309                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xba7:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	77                              # DW_AT_decl_line
	.long	2336                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xbae:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	78                              # DW_AT_decl_line
	.long	2363                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xbb5:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	80                              # DW_AT_decl_line
	.long	2381                            # DW_AT_import
	.byte	23                              # Abbrev [23] 0xbbc:0x7 DW_TAG_imported_declaration
	.byte	9                               # DW_AT_decl_file
	.byte	81                              # DW_AT_decl_line
	.long	2429                            # DW_AT_import
	.byte	41                              # Abbrev [41] 0xbc3:0xc DW_TAG_subprogram
	.long	.Linfo_string75                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	467                             # DW_AT_decl_line
	.long	1773                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	42                              # Abbrev [42] 0xbcf:0x32 DW_TAG_subprogram
	.quad	.Lfunc_begin1                   # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
	.long	3046                            # DW_AT_object_pointer
                                        # DW_AT_GNU_all_call_sites
	.long	1117                            # DW_AT_specification
	.byte	43                              # Abbrev [43] 0xbe6:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.long	.Linfo_string91                 # DW_AT_name
	.long	3288                            # DW_AT_type
                                        # DW_AT_artificial
	.byte	44                              # Abbrev [44] 0xbf1:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc12                   # DW_AT_location
	.long	.Linfo_string87                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.long	1194                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	35                              # Abbrev [35] 0xc01:0x16 DW_TAG_subprogram
	.long	.Linfo_string76                 # DW_AT_name
	.byte	10                              # DW_AT_decl_file
	.byte	213                             # DW_AT_decl_line
	.long	1639                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	15                              # Abbrev [15] 0xc0c:0x5 DW_TAG_formal_parameter
	.long	1639                            # DW_AT_type
	.byte	15                              # Abbrev [15] 0xc11:0x5 DW_TAG_formal_parameter
	.long	3095                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	20                              # Abbrev [20] 0xc17:0x5 DW_TAG_pointer_type
	.long	3100                            # DW_AT_type
	.byte	45                              # Abbrev [45] 0xc1c:0x22 DW_TAG_structure_type
	.byte	5                               # DW_AT_calling_convention
	.long	.Linfo_string81                 # DW_AT_name
	.byte	16                              # DW_AT_byte_size
	.byte	12                              # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.byte	12                              # Abbrev [12] 0xc25:0xc DW_TAG_member
	.long	.Linfo_string77                 # DW_AT_name
	.long	3134                            # DW_AT_type
	.byte	12                              # DW_AT_decl_file
	.byte	12                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	12                              # Abbrev [12] 0xc31:0xc DW_TAG_member
	.long	.Linfo_string79                 # DW_AT_name
	.long	3145                            # DW_AT_type
	.byte	12                              # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	30                              # Abbrev [30] 0xc3e:0xb DW_TAG_typedef
	.long	1699                            # DW_AT_type
	.long	.Linfo_string78                 # DW_AT_name
	.byte	11                              # DW_AT_decl_file
	.byte	160                             # DW_AT_decl_line
	.byte	30                              # Abbrev [30] 0xc49:0xb DW_TAG_typedef
	.long	1699                            # DW_AT_type
	.long	.Linfo_string80                 # DW_AT_name
	.byte	11                              # DW_AT_decl_file
	.byte	197                             # DW_AT_decl_line
	.byte	42                              # Abbrev [42] 0xc54:0x32 DW_TAG_subprogram
	.quad	.Lfunc_begin4                   # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
	.long	3179                            # DW_AT_object_pointer
                                        # DW_AT_GNU_all_call_sites
	.long	1578                            # DW_AT_specification
	.byte	43                              # Abbrev [43] 0xc6b:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.long	.Linfo_string91                 # DW_AT_name
	.long	3293                            # DW_AT_type
                                        # DW_AT_artificial
	.byte	44                              # Abbrev [44] 0xc76:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc15                   # DW_AT_location
	.long	.Linfo_string87                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	23                              # DW_AT_decl_line
	.long	1194                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	46                              # Abbrev [46] 0xc86:0x29 DW_TAG_subprogram
	.quad	.Lfunc_begin2                   # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
	.long	3233                            # DW_AT_object_pointer
                                        # DW_AT_GNU_all_call_sites
	.long	.Linfo_string83                 # DW_AT_linkage_name
	.long	1550                            # DW_AT_specification
	.byte	47                              # Abbrev [47] 0xca1:0xd DW_TAG_formal_parameter
	.long	.Ldebug_loc13                   # DW_AT_location
	.long	.Linfo_string91                 # DW_AT_name
	.long	3293                            # DW_AT_type
                                        # DW_AT_artificial
	.byte	0                               # End Of Children Mark
	.byte	46                              # Abbrev [46] 0xcaf:0x29 DW_TAG_subprogram
	.quad	.Lfunc_begin3                   # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
	.long	3274                            # DW_AT_object_pointer
                                        # DW_AT_GNU_all_call_sites
	.long	.Linfo_string84                 # DW_AT_linkage_name
	.long	1564                            # DW_AT_specification
	.byte	47                              # Abbrev [47] 0xcca:0xd DW_TAG_formal_parameter
	.long	.Ldebug_loc14                   # DW_AT_location
	.long	.Linfo_string91                 # DW_AT_name
	.long	3293                            # DW_AT_type
                                        # DW_AT_artificial
	.byte	0                               # End Of Children Mark
	.byte	20                              # Abbrev [20] 0xcd8:0x5 DW_TAG_pointer_type
	.long	1093                            # DW_AT_type
	.byte	20                              # Abbrev [20] 0xcdd:0x5 DW_TAG_pointer_type
	.long	1529                            # DW_AT_type
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.Ltmp43
	.quad	.Ltmp77
	.quad	.Ltmp78
	.quad	.Ltmp91
	.quad	.Ltmp93
	.quad	.Ltmp95
	.quad	0
	.quad	0
.Ldebug_ranges1:
	.quad	.Lfunc_begin0
	.quad	.Lfunc_end0
	.quad	.Lfunc_begin1
	.quad	.Lfunc_end1
	.quad	.Lfunc_begin2
	.quad	.Lfunc_end2
	.quad	.Lfunc_begin3
	.quad	.Lfunc_end3
	.quad	.Lfunc_begin4
	.quad	.Lfunc_end4
	.quad	0
	.quad	0
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 11.0.0"          # string offset=0
.Linfo_string1:
	.asciz	"test2-kec.cpp"                 # string offset=21
.Linfo_string2:
	.asciz	"/home/ethanf/A/pro/HPC"        # string offset=35
.Linfo_string3:
	.asciz	"a"                             # string offset=58
.Linfo_string4:
	.asciz	"data"                          # string offset=60
.Linfo_string5:
	.asciz	"float"                         # string offset=65
.Linfo_string6:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=71
.Linfo_string7:
	.asciz	"_ZN6MatrixixEm"                # string offset=91
.Linfo_string8:
	.asciz	"operator[]"                    # string offset=106
.Linfo_string9:
	.asciz	"std"                           # string offset=117
.Linfo_string10:
	.asciz	"long unsigned int"             # string offset=121
.Linfo_string11:
	.asciz	"size_t"                        # string offset=139
.Linfo_string12:
	.asciz	"Matrix"                        # string offset=146
.Linfo_string13:
	.asciz	"b"                             # string offset=153
.Linfo_string14:
	.asciz	"c"                             # string offset=155
.Linfo_string15:
	.asciz	"Matrix2"                       # string offset=157
.Linfo_string16:
	.asciz	"~Matrix2"                      # string offset=165
.Linfo_string17:
	.asciz	"_ZN7Matrix2ixEm"               # string offset=174
.Linfo_string18:
	.asciz	"abs"                           # string offset=190
.Linfo_string19:
	.asciz	"int"                           # string offset=194
.Linfo_string20:
	.asciz	"div_t"                         # string offset=198
.Linfo_string21:
	.asciz	"quot"                          # string offset=204
.Linfo_string22:
	.asciz	"long int"                      # string offset=209
.Linfo_string23:
	.asciz	"rem"                           # string offset=218
.Linfo_string24:
	.asciz	"ldiv_t"                        # string offset=222
.Linfo_string25:
	.asciz	"abort"                         # string offset=229
.Linfo_string26:
	.asciz	"atexit"                        # string offset=235
.Linfo_string27:
	.asciz	"at_quick_exit"                 # string offset=242
.Linfo_string28:
	.asciz	"atof"                          # string offset=256
.Linfo_string29:
	.asciz	"double"                        # string offset=261
.Linfo_string30:
	.asciz	"char"                          # string offset=268
.Linfo_string31:
	.asciz	"atoi"                          # string offset=273
.Linfo_string32:
	.asciz	"atol"                          # string offset=278
.Linfo_string33:
	.asciz	"bsearch"                       # string offset=283
.Linfo_string34:
	.asciz	"__compar_fn_t"                 # string offset=291
.Linfo_string35:
	.asciz	"calloc"                        # string offset=305
.Linfo_string36:
	.asciz	"div"                           # string offset=312
.Linfo_string37:
	.asciz	"exit"                          # string offset=316
.Linfo_string38:
	.asciz	"free"                          # string offset=321
.Linfo_string39:
	.asciz	"getenv"                        # string offset=326
.Linfo_string40:
	.asciz	"labs"                          # string offset=333
.Linfo_string41:
	.asciz	"ldiv"                          # string offset=338
.Linfo_string42:
	.asciz	"malloc"                        # string offset=343
.Linfo_string43:
	.asciz	"mblen"                         # string offset=350
.Linfo_string44:
	.asciz	"mbstowcs"                      # string offset=356
.Linfo_string45:
	.asciz	"wchar_t"                       # string offset=365
.Linfo_string46:
	.asciz	"mbtowc"                        # string offset=373
.Linfo_string47:
	.asciz	"qsort"                         # string offset=380
.Linfo_string48:
	.asciz	"quick_exit"                    # string offset=386
.Linfo_string49:
	.asciz	"rand"                          # string offset=397
.Linfo_string50:
	.asciz	"realloc"                       # string offset=402
.Linfo_string51:
	.asciz	"srand"                         # string offset=410
.Linfo_string52:
	.asciz	"unsigned int"                  # string offset=416
.Linfo_string53:
	.asciz	"strtod"                        # string offset=429
.Linfo_string54:
	.asciz	"strtol"                        # string offset=436
.Linfo_string55:
	.asciz	"strtoul"                       # string offset=443
.Linfo_string56:
	.asciz	"system"                        # string offset=451
.Linfo_string57:
	.asciz	"wcstombs"                      # string offset=458
.Linfo_string58:
	.asciz	"wctomb"                        # string offset=467
.Linfo_string59:
	.asciz	"__gnu_cxx"                     # string offset=474
.Linfo_string60:
	.asciz	"long long int"                 # string offset=484
.Linfo_string61:
	.asciz	"lldiv_t"                       # string offset=498
.Linfo_string62:
	.asciz	"_Exit"                         # string offset=506
.Linfo_string63:
	.asciz	"llabs"                         # string offset=512
.Linfo_string64:
	.asciz	"lldiv"                         # string offset=518
.Linfo_string65:
	.asciz	"atoll"                         # string offset=524
.Linfo_string66:
	.asciz	"strtoll"                       # string offset=530
.Linfo_string67:
	.asciz	"strtoull"                      # string offset=538
.Linfo_string68:
	.asciz	"long long unsigned int"        # string offset=547
.Linfo_string69:
	.asciz	"strtof"                        # string offset=570
.Linfo_string70:
	.asciz	"strtold"                       # string offset=577
.Linfo_string71:
	.asciz	"long double"                   # string offset=585
.Linfo_string72:
	.asciz	"_ZN9__gnu_cxx3divExx"          # string offset=597
.Linfo_string73:
	.asciz	"_ZSt3absg"                     # string offset=618
.Linfo_string74:
	.asciz	"__float128"                    # string offset=628
.Linfo_string75:
	.asciz	"drand48"                       # string offset=639
.Linfo_string76:
	.asciz	"clock_gettime"                 # string offset=647
.Linfo_string77:
	.asciz	"tv_sec"                        # string offset=661
.Linfo_string78:
	.asciz	"__time_t"                      # string offset=668
.Linfo_string79:
	.asciz	"tv_nsec"                       # string offset=677
.Linfo_string80:
	.asciz	"__syscall_slong_t"             # string offset=685
.Linfo_string81:
	.asciz	"timespec"                      # string offset=703
.Linfo_string82:
	.asciz	"main"                          # string offset=712
.Linfo_string83:
	.asciz	"_ZN7Matrix2C2Ev"               # string offset=717
.Linfo_string84:
	.asciz	"_ZN7Matrix2D2Ev"               # string offset=733
.Linfo_string85:
	.asciz	"ptime"                         # string offset=749
.Linfo_string86:
	.asciz	"time"                          # string offset=755
.Linfo_string87:
	.asciz	"i"                             # string offset=760
.Linfo_string88:
	.asciz	"j"                             # string offset=762
.Linfo_string89:
	.asciz	"k"                             # string offset=764
.Linfo_string90:
	.asciz	"dtime"                         # string offset=766
.Linfo_string91:
	.asciz	"this"                          # string offset=772
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.DW.ref.__gxx_personality_v0,"aGw",@progbits,DW.ref.__gxx_personality_v0,comdat
	.p2align	3
	.type	DW.ref.__gxx_personality_v0,@object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"clang version 11.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __gxx_personality_v0
	.addrsig_sym _Unwind_Resume
	.addrsig_sym __stack_chk_fail
	.addrsig_sym _ZZ4mainE1a
	.addrsig_sym _ZZ4mainE1b
	.addrsig_sym _ZZ4mainE1c
	.addrsig_sym _ZZ4mainE1a_0
	.addrsig_sym _ZGVZ4mainE1a_0
	.addrsig_sym __dso_handle
	.addrsig_sym _ZZ4mainE1b_0
	.addrsig_sym _ZGVZ4mainE1b_0
	.addrsig_sym _ZZ4mainE1c_0
	.addrsig_sym _ZGVZ4mainE1c_0
	.section	.debug_line,"",@progbits
.Lline_table_start0:
