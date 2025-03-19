.section .text
.global _start 

_start:
li a0, 0x42
li a1, 0xED
add a0, a0, a1
ecall 
