.data
numbers: .word 0x42, 0x37, 0xFD, 0x83, 0x11

.text
.global _start
_start:
    la   s0, numbers       
    lw   s1, 0(s0)         
    li   t0, 4             
    addi s0, s0, 4        

loop:
    lw   t1, 0(s0)         
    bge  s1, t1, skip      
    mv   s1, t1            
skip:
    addi s0, s0, 4         
    addi t0, t0, -1        
    bnez t0, loop          
    mv   a0, s1            
    ecall                 