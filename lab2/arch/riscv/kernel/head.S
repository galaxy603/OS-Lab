.extern start_kernel

    .section .text.init
    .globl _start
_start:

    # set stvec = _traps
    la t0,  _traps
    csrw stvec, t0

    # ------------------

    # set sie[STIE] = 1
    csrr t0, sie
    ori t0, t0, 1<<5
    csrw sie, t0
    # ------------------

    # set first time interrupt
    	
	rdtime t0
	li t1, 10000000
	add a0, t0, t1
	li a6, 0x0
	li a7, 0x0
	li a1, 0
	li a2, 0
        li a3, 0
        li a4, 0
        li a5, 0
	ecall
	
	
    # ------------------

        # set sstatus[SIE] = 1
	csrr t0, sstatus
	ori t0, t0, 1<<1
	csrw sstatus, t0
    # ------------------
    
    # ------------------
    la sp, boot_stack_top
    call start_kernel
    # ------------------

    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 4096 # <-- change to your stack size

    .globl boot_stack_top
boot_stack_top:
