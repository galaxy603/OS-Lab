    .section .text.entry
    .align 2
    .globl _traps 
_traps:
    # YOUR CODE HERE
    # -----------

        # 1. save 32 registers and sepc to stack
	addi sp, sp, -33*8 #64bit risc-v
	sd x0, 0*8(sp)
	sd x1, 1*8(sp)
        sd x2, 2*8(sp)
        sd x3, 3*8(sp)
        sd x4, 4*8(sp)
        sd x5, 5*8(sp)
        sd x6, 6*8(sp)
        sd x7, 7*8(sp)
        sd x8, 8*8(sp)
        sd x9, 9*8(sp)
        sd x10, 10*8(sp)
        sd x11, 11*8(sp)
        sd x12, 12*8(sp)
        sd x13, 13*8(sp)
        sd x14, 14*8(sp)
        sd x15, 15*8(sp)
        sd x16, 16*8(sp)
        sd x17, 17*8(sp)
        sd x18, 18*8(sp)
        sd x19, 19*8(sp)
        sd x20, 20*8(sp)
        sd x21, 21*8(sp)
        sd x22, 22*8(sp)
        sd x23, 23*8(sp)
        sd x24, 24*8(sp)
        sd x25, 25*8(sp)
        sd x26, 26*8(sp)
        sd x27, 27*8(sp)
        sd x28, 28*8(sp)
        sd x29, 29*8(sp)
        sd x30, 30*8(sp)
        sd x31, 31*8(sp)
	csrr t0, sepc
        sd t0, 32*8(sp)

    # -----------

        # 2. call trap_handler
	csrr a0, scause
	csrr a1, sepc
	call trap_handler

    # -----------

        # 3. restore sepc and 32 registers (x2(sp) should be restore last) from stack
ld t0, 32*8(sp)
csrw sepc, t0

ld x0, 0*8(sp)
ld x1, 1*8(sp)
ld x3, 3*8(sp)
ld x4, 4*8(sp)
ld x5, 5*8(sp)
ld x6, 6*8(sp)
ld x7, 7*8(sp)
ld x8, 8*8(sp)
ld x9, 9*8(sp)
ld x10, 10*8(sp)
ld x11, 11*8(sp)
ld x12, 12*8(sp)
ld x13, 13*8(sp)
ld x14, 14*8(sp)
ld x15, 15*8(sp)
ld x16, 16*8(sp)
ld x17, 17*8(sp)
ld x18, 18*8(sp)
ld x19, 19*8(sp)
ld x20, 20*8(sp)
ld x21, 21*8(sp)
ld x22, 22*8(sp)
ld x23, 23*8(sp)
ld x24, 24*8(sp)
ld x25, 25*8(sp)
ld x26, 26*8(sp)
ld x27, 27*8(sp)
ld x28, 28*8(sp)
ld x29, 29*8(sp)
ld x30, 30*8(sp)
ld x31, 31*8(sp)
ld x2, 2*8(sp)

addi sp, sp, 33*8
#x2是sp寄存器，必须最后恢复，否则sp指针发生变化，后面无法对应

    # -----------

        # 4. return from trap
   	sret

    # -----------
