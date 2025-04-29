1) this code is for making a 4-bit operation  calculator using different logic gates  using basys3 board artix7 architecture
2) this code contains operations like addition subtraction division and multiplication

3) steps open Vivado xilinx 2021.2  version
4) create verilog files i) arithmetic_operations.v (instance file)  --------> create in design sources
                       ii) adder_4bit , subtract_4bit , mul_4bit ,divider_4bit   add these files in arithmetic_operation.v 
                       iii) create testbench file in simulation sources
                       iv) create constraint file .xdc file in constraints
5) run simulation for checking & cerfying testbench simulation
6)run sysnthesis
7) run implementation design
8) note that junction temperature should not exceed
9) generate bitstream file
