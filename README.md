# MIPS32-bit-Single_Cycle_Architecture_Implementation

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

![Screenshot 2022-06-26 172836](https://user-images.githubusercontent.com/98607828/175813009-dbca3a94-3c2d-4c5b-89f9-1cfd5b20c001.jpg)

# J-type
 it is also called as Pseudo-addressing mode since the instruction can point to any byte addressable location inside of a memory using jump instruction. in this opcode is 6 bit (here 000010(2))and address field has 26 bits(in which the upper 4 bit of program counter are concatenated with 26 bit address field ) which is shifted left by 2 to multiple it with 4 so the instruction that it points to remains byte addressable.
 
 ![jump](https://user-images.githubusercontent.com/98607828/175809280-7bdf28cd-9850-4764-aa86-ff619dda153d.jpg)

  

# Architecture
![Screenshot 2022-06-26 130614](https://user-images.githubusercontent.com/98607828/175804375-ceb35435-219e-42f3-87d5-7ab6588e048b.jpg)

![mips](https://user-images.githubusercontent.com/98607828/175813163-aaff2f73-2af3-4387-b1ff-64b2eb4f8e2f.jpg)


# Simulation



![sim2](https://user-images.githubusercontent.com/98607828/175819264-ea26e036-b392-4a29-9026-5dfb44aa7ab8.jpg)


--first instruction is at rom[0] = 0226020 H (Which is already been depicted in Instuction memory 
   pointed as R-type instruction for add. Here opcode is 000000 for R-type while control bits for selection 
   between Load/Store or R-type is different Opfield is 10 for R-type (Addition)
   and function field opcode is also different which in case of Load/Store/Branch/Jump is not required . 
   in the following , picture You can see the content stored in RD1 reg and RD2 reg is Stored and added to
   store the result back from alu_out to reg file  loc(R[12]).

--second instruction is basically logically AND operation (33) & (15) = 1 or (100001)&(001111)  ---alu_result = 1
 
 --third instruction is add immediate (I-type) in which offset is 1148 while rs(source reg ) is storing 12 at
   rs[14] loc. which computes the result as 1160 and stores back to reg file loc at Rt[0].
   

--fourth instruction is store word(in Sim. Window (aca4001H)) ( mem($rs[source reg addr]+offset) <= rt(data to be stored from 
destination address regster to the address formed by rs+offset).Here offset is 1 and rs is 1111(15) as pointed by the
address of this in instruction memory which adds upto 16 (this forms the address location in data memory) and looks for 
the dest.reg address location to retrieve the data as mentioned in instruction it is (rt=01000) which is having 1 as data value , stored to WR_mem.
 
--fifth instruction is Load word (8f02002H)  ( rt <= mem(rs[reg addr] + offset)) data from memory address pointed by (source operand reg(rs) data from its location + offset ) to the reg file . in this source rs = 11000(24) which is storing value as 0 while offset is 2 which adds up to 2 and this is our memory address and we retrieve the contents from data memory loc[2] to dest.reg (read the contents from memory and store back to reg file ) as 63 . 


  # References 
     1.  Computer Organization and Design : The Hardware/Software Interface , Fifth Edition(The Morgan Kaufmann series in Computer Architecture and Design)
     2.  Computer Organization and Design (Hardware/Software Interface) RISC-V Edition by DAVID A. PATTERSON and JOHN L. HENNESSY  
     3.  https://www.youtube.com/watch?v=CDO28Esqmcg&list=PLhwVAYxlh5dvB1MkZrcRZy6x_a2yORNAu
