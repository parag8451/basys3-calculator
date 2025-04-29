\\thiss verilog file is  an instances file  , combined code forr addition subtraction divison andd multiplication

`timescale 1ns / 1ps

module arithmetic_operations (
    input [3:0] A, B,             // 4-bit inputs A and B
    input [1:0] operation,        // 2-bit operation select signal
    output reg [7:0] result       // 8-bit result: sum, diff, product, or quotient
);

    wire [3:0] sum, diff;
    wire [7:0] product;
    wire [3:0] quotient;

    // 4-bit Adder
    adder_4bit adder_inst (
        .A(A),
        .B(B),
        .Cin(0),
        .Sum(sum),
        .Cout()  // Unused
    );

    // 4-bit Subtractor
    subtractor_4bit subtractor_inst (
        .A(A),
        .B(B),
        .Diff(diff),
        .Borrow()  // Unused
    );

    // 4-bit Multiplier
    mult4bit multiplier_inst (
        .a(A),
        .b(B),
        .p(product)
    );

    // 4-bit Divider (Quotient only)
    divider_4bit divider_inst (
        .A(A),
        .B(B),
        .Quotient(quotient)
    );

    always @(*) begin
        case (operation)
            2'b00: result = {4'b0, sum};        // Addition
            2'b01: result = {4'b0, diff};       // Subtraction
            2'b10: result = product;            // Multiplication
            2'b11: result = {4'b0, quotient};   // Division (quotient only)
            default: result = 8'b0;
        endcase
    end

endmodule
