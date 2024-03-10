# ALU
 Design an arithmetic and logic unit (ALU). It takes an input signal a of 4 bits and a Control signal of 2 bits. The ALU, depending on the value of the Control signal, performs the following operations:

* '00': sll (logical left shift)
* '01': srl (logical right shift)
* '10': rol (circular left shift)
* '11': ror (circular right shift)
At the output, there is a Result signal of 4 bits with the result of the operation. You should not use any VHDL function that directly implements the operations.

Create a new project in Vivado named ALU, use the given entity declaration (which you cannot change), and propose architectures that solve the problem as follows:
1. Dataflow architecture
2. Behavioral architecture
3. Structural architecture, where the ALU entity uses two components: ShiftLR_4bit and RotateLR_4bit, implementing the shift and rotate operations, respectively. The entities are provided.
4. Structural architecture, where the ALU entity uses two components found in the Part_b_2bit file 

 The implementation and the results are explained on this pdf. 
[ReadMe.pdf](https://github.com/Vicky-Christofilopoulou/ALU/files/14550492/ReadMe.pdf)
