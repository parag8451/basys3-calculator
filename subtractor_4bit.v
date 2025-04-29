`timescale 1ns / 1ps

module subtractor_4bit (
    input [3:0] A, B,
    output [3:0] Diff,
    output Borrow
);
    wire b1, b2, b3;

    full_subtractor FS0 (.a(A[0]), .b(B[0]), .bin(1'b0), .diff(Diff[0]), .bout(b1));
    full_subtractor FS1 (.a(A[1]), .b(B[1]), .bin(b1), .diff(Diff[1]), .bout(b2));
    full_subtractor FS2 (.a(A[2]), .b(B[2]), .bin(b2), .diff(Diff[2]), .bout(b3));
    full_subtractor FS3 (.a(A[3]), .b(B[3]), .bin(b3), .diff(Diff[3]), .bout(Borrow));
endmodule

module full_subtractor (
    input a, b, bin,
    output diff, bout
);
    wire w1, w2, w3;
    
    xor (w1, a, b);
    xor (diff, w1, bin);
    and (w2, ~a, b);
    and (w3, ~w1, bin);
    or (bout, w2, w3);
endmodule
