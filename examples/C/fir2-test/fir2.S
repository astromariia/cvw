# fir.S 
# assembly language of Finite Impulse Response (FIR)

// a0: base address of x
// a1: base address of c
// a2: base address of y, later used as pointer to y[j] in j loop
// a3: n
// a4: m

// t0: &y[n-m] to check termination of j loop
// t1: &c[m] to check termination of i loop
// t2: &x[j+m-1]
// t3: sum
// t4: pointer to c[i] in i loop
// t5: pointer to x[j-i+(m-1)] 
// t6: value of c[i]
// a5: value of x[j-1+(m-1)]

.global fir

fir:
    sub t0, a3, a4       
    addi t0, t0, 1      
    slli t0, t0, 2        
    add t0, a2, t0        

    addi t2, a4, -1       
    slli t2, t2, 2        
    add t2, a0, t2       

forj: 
    bge a2, t0, donej     
    li t3, 0              
    li t1, 0              
    mv t4, a1             
    mv t5, t2             

fori:
    lw t6, 0(t4)          
    lw a5, 0(t5)          

    addi t4, t4, 4        
    addi t5, t5, -4       

    mul a7, t6, a5        
    srai a7, a7, 31      
    add t3, t3, a7        

    addi t1, t1, 1        
    blt t1, a4, fori      

    sw t3, 0(a2)          
    addi a2, a2, 4        
    addi t2, t2, 4        
    j forj

donej:
    ret
