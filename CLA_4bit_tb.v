// Testbench for 4-bit Carry Look-Ahead Adder
// Author: Shivaprasad B Sudi

`timescale 1ns / 1ps

module CLA_4bit_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire [3:0] Sum;
    wire Carry_Out;

    // Instantiate the Unit Under Test (UUT)
    CLA_4bit uut (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Carry_Out(Carry_Out)
    );

    initial begin
        // Monitor the signals
        $monitor("Time = %0d : A = %b, B = %b => Sum = %b, Carry_Out = %b", 
                  $time, A, B, Sum, Carry_Out);

        // Test Case 1: 5 + 3 = 8
        A = 4'b0101; // 5
        B = 4'b0011; // 3
        #10;

        // Test Case 2: 7 + 6 = 13
        A = 4'b0111;
        B = 4'b0110;
        #10;

        // Test Case 3: 11 + 13 = 24
        A = 4'b1011;
        B = 4'b1101;
        #10;

        // Test Case 4: 0 + 0 = 0
        A = 4'b0000;
        B = 4'b0000;
        #10;

        // Test Case 5: 15 + 1 = 16 (overflow)
        A = 4'b1111;
        B = 4'b0001;
        #10;

        // End simulation
        $finish;
    end

endmodule
