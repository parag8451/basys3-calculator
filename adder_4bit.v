\\this is 4-bit full addder code for perorming 4bit adddition operation

`timescale 1ns / 1ps

module adder_4bit (
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire c1, c2, c3;

    full_adder FA0 (.a(A[0]), .b(B[0]), .cin(Cin), .sum(Sum[0]), .cout(c1));
    full_adder FA1 (.a(A[1]), .b(B[1]), .cin(c1), .sum(Sum[1]), .cout(c2));
    full_adder FA2 (.a(A[2]), .b(B[2]), .cin(c2), .sum(Sum[2]), .cout(c3));
    full_adder FA3 (.a(A[3]), .b(B[3]), .cin(c3), .sum(Sum[3]), .cout(Cout));
endmodule

module full_adder (
    input a, b, cin,
    output sum, cout
);
    wire w1, w2, w3;
    
    xor (w1, a, b);
    xor (sum, w1, cin);
    and (w2, a, b);
    and (w3, w1, cin);
    or (cout, w2, w3);
endmodule



