.global rvtest_entry_point
rvtest_entry_point:
    la sp, topofstack       # Initialize stack pointer
    la t0, N                # Get address of N
    ld a0, 0(t0)            # Load N = 6
    csrr s8, instret        # Start instruction count
    jal sum                 # Call sum(6)
    csrr s9, instret        # End instruction count
    sub s9, s9, s8          # Total instructions for sum()
    la t0, begin_signature  
    sd a0, 0(t0)            # Store sum(1+2+3+4+5+6) = 21
    sd s9, 8(t0)            # Store cycle count
write_tohost:
    la t1, tohost
    li t0, 1                # Success code
    sd t0, 0(t1)
self_loop:
    j self_loop             # Halt

# Sum function (1 + 2 + ... + N)
sum:
    li t0, 0                # Initialize sum = 0
    li t1, 1                # Counter i = 1
sum_loop:
    add t0, t0, t1          # sum += i
    addi t1, t1, 1          # i++
    ble t1, a0, sum_loop     # Loop if i <= N
    mv a0, t0               # Return sum
    ret

.section .tohost
tohost: .dword 0
fromhost: .dword 0

.data
N: .dword 6                 # N = 6
.EQU XLEN,64
begin_signature:
    .fill 2*(XLEN/32),4,0xdeadbeef
end_signature:

.bss
.space 512
topofstack: