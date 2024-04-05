	.file	"main.c"
	.text
	.globl	_swap
	.def	_swap;	.scl	2;	.type	32;	.endef
_swap:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_partition
	.def	_partition;	.scl	2;	.type	32;	.endef
_partition:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -8(%ebp)
	jmp	L3
L6:
	addl	$1, -4(%ebp)
L4:
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	L7
	movl	16(%ebp), %eax
	subl	$1, %eax
	cmpl	-4(%ebp), %eax
	jge	L6
	jmp	L7
L9:
	subl	$1, -8(%ebp)
L7:
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	-12(%ebp), %eax
	jle	L8
	movl	12(%ebp), %eax
	addl	$1, %eax
	cmpl	-8(%ebp), %eax
	jle	L9
L8:
	movl	-4(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jge	L3
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_swap
L3:
	movl	-4(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jl	L4
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_swap
	movl	-8(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.globl	_quickSort
	.def	_quickSort;	.scl	2;	.type	32;	.endef
_quickSort:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jge	L14
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_partition
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_quickSort
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_quickSort
L14:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Original array: \0"
LC1:
	.ascii "%d \0"
LC2:
	.ascii "\12Sorted array: \0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$64, %esp
	call	___main
	movl	$19, 16(%esp)
	movl	$17, 20(%esp)
	movl	$15, 24(%esp)
	movl	$12, 28(%esp)
	movl	$16, 32(%esp)
	movl	$18, 36(%esp)
	movl	$4, 40(%esp)
	movl	$11, 44(%esp)
	movl	$13, 48(%esp)
	movl	$9, 52(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, 60(%esp)
	jmp	L16
L17:
	movl	60(%esp), %eax
	movl	16(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	addl	$1, 60(%esp)
L16:
	movl	60(%esp), %eax
	cmpl	52(%esp), %eax
	jl	L17
	movl	52(%esp), %eax
	subl	$1, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	call	_quickSort
	movl	$LC2, (%esp)
	call	_printf
	movl	$0, 56(%esp)
	jmp	L18
L19:
	movl	56(%esp), %eax
	movl	16(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	addl	$1, 56(%esp)
L18:
	movl	56(%esp), %eax
	cmpl	52(%esp), %eax
	jl	L19
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
