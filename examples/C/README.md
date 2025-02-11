# Short Lab Intro:
In this lab we learned about the RISC-V toolchain workflows, assembling and dissambling files and implementing Q1.31 fixed-point FIR filter. We used C language to build add_q31() a function designed to safely add two Q1.31 fixed-point numbers. We modified the Makefile to work with both -O and -O2 optimizations. Afterwards, we built an assembly file that accomplished the same task with pretty similar cycle counts.

# Section 2
 git clone --recurse-submodules https://github.com/astromariia/cvw.git
* cd cvw
* source ./setup.sh.
* ls
* ls -l\
* ls -l
* chmod +x setup.sh
* source ./setup.sh.
* source ./setup.sh
* echo $WALLY
* cd examples/C/hello.
* cd examples/C/hello
* make
* wsim --sim questa rv64gc --elf hello
* cd $WALLY/examples/asm/example
* riscv64-unknown-elf-gcc -o example -march=rv32i -mabi=ilp32 -mcmodel=medany -nostartfiles -T../../link/link.ld example.S
* riscv64-unknown-elf-objdump -D example > example.objdump
* riscv64-unknown-elf-objdump -D example > example.objdump


   # Section 3
* cat common/test.ld
* cd ..
* cat Makefile
* make
* make clean
* cd $WALLY/examples/asm/sumtest
* make
* spike +signature=sumtest.signature.output sumtest
* cat sumtest
* diff sumtest.signature.output sumtest.reference_output
* make clean
* make
* make sim
* riscv64-unknoqn-elf-readelf -a sumtest
* riscv64-unknown-elf-readelf -a sumtest
* cd $WALLY/examples/C/sum
* make
* spike sum
* wsim --sim questa rv64gc --elf sum

# Table of for the number of cycles
| Simulator Data                        |  Spike   | Wsim  |
| :------------------------------------:| :------: | ----: |
| Exit status of the program(s)         |    10    |  10   |
| Clock cycles (mcycle)                 |    31    |  80   |
| Total instructions retired (minstret) |    38    |  38   |

# Instructions for running fir1 and fir2
Make sure Wally is activated:
source ./setup.sh
Then navigate to the fir1 folder
type make clean
type make

For fir2 navigate to that folder
type make clean
type make 
