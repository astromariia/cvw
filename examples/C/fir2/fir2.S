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
# where the arrays should end
sub t0, a3,a4
addi t0, t0,1
#mul t0, t0,4
add t0,t0,a2
add t1, t1,zero


forj: 
bge  a2,t0,donej
mv t3,zero
mv t1, zero
mv t4,a1
mv t5,a0
fori:
bge t1, a4, donei
lw t6,t4
lw a5,t5
mul a7,t6,a5
srli a7, a7,31
add t3, t3, a7
addi t4, t4,4
addi t5, t5,4
addi t1,t1,1
j fori

donei:
 #   sw t3,a2
    addi a2, a2, 4
  #  sub t4, t4,16
   # sub t5,t5,12
    #sub t1, t1,4
addi a0,a0,4
    j forj

donej:
    ret                 # all done; return	