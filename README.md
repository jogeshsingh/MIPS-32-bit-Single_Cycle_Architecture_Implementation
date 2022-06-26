# MIPS32-bit-Single_Cycle_Architecture_Implementation

# Description
Designed MIPS32(Microprocessor without Interlocked Pipelined Stages)bit single cycle architecture.
Following things are required to get through this Project -:
     # Digital Logic Design # Computer Architecture (Basic) # Verilog HDL (Or VHDL , SYSTEM VERILOG)  # Synthesis software(XILINX VIVADO OR Quartus intel prime        lite(these both are free) ) # Simulation Tool(Xsim , Modelsim)
       
# ISA
  MIPS is basically the kind of RISC-philosphy , and have instructions particularly similar to RISC(Reduced instruction set architecture ) but differs in instruction      width and branch equal for some operations .
  In MIPS , there are basically three kind of instruction format.
  R-type , I-type , J-type .
  # R-type 
  This is also called Register addressing mode , operations like data processing are basically carried out using this instruction (ALU operations --like Subtraction , addition , logical OR, logical AND etc.)
  
![Screenshot 2022-06-26 150955](https://user-images.githubusercontent.com/98607828/175808545-40ffd0df-f0c8-4b18-a997-5b18ac779dd3.jpg)
 
 
 for e.g ADD R1 , R2,  R3 . Here ADD is opcode , while  R2 AND R3 are source operands(Register addresses) and R1 is destination Register address , the data which R2 and  R3 hold in particular address is stored in address pointed by R1 (destination Reg address). 
 
  # I-type
  This is also called as Immediate addressing . It is used for loading an immmediate data to particular register and also used for Load(laoding the data from memory and storing it inside of register file dest_reg <-- rs_source(mem_offset)) or Store(Storing the value pointed by reg_source +offset ->mem(dest_reg)). Branch Instruction(PC-relative addressing) could also be implemented using I-type instruction the only chnage is in opcode field.


# J-type
 it is also called as Pseudo-addressing mode since the instruction can point to any 2^n location inside of a memory using jump instruction. in this opcode is 6 bit (here 000010(2))and address field has 26 bits(in which the upper 4 bit of program counter are concatenated with 26 bit address field ) which is shifted left by 2 to multiple it with 4 so the instruction that it points to remains byte addressable.
 
 ![jump](https://user-images.githubusercontent.com/98607828/175809280-7bdf28cd-9850-4764-aa86-ff619dda153d.jpg)

  

# Architecture
![Screenshot 2022-06-26 130614](https://user-images.githubusercontent.com/98607828/175804375-ceb35435-219e-42f3-87d5-7ab6588e048b.jpg)

![Screenshot 2022-06-26 130157](https://user-images.githubusercontent.com/98607828/175804284-ea8c9482-dd96-43f6-9bf6-933bca9b1de1.jpg)

# Simulation

--first instruction is at rom[0] = 0226020 H (Which is already been depicted in Instuction memory pointed as R-type instruction for add.
        here opcode is 000000 for R-type while control bits for slection between Load/Store or R-type is different Opfield is 10 for R-type (Addition)
        and function field opcode is also different which in case of Load/Store/Branch/Jump is not required . 
        in the following , picture You can see the content stored in RD1 reg and RD2 reg is Stored and added to store the result back from alu_out to reg file loc(R[12]).
        ![Screenshot 2022-06-26 165614](https://user-images.githubusercontent.com/98607828/175811985-53cce4e9-a3fa-41ea-9a83-dc41932bf52c.jpg)
