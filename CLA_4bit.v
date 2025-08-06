// 4-bit Carry Look-Ahead Adder
// Designed by Shivaprasad B Sudi (2023-2024)

module CLA_4bit (
    input  [3:0] A,       // 4-bit input A
    input  [3:0] B,       // 4-bit input B
    output [3:0] Sum,     // 4-bit Sum output
    output       Carry_Out // Final carry output
);

    wire [3:0] G; // Generate
    wire [3:0] P; // Propagate
    wire [4:0] C; // Carry bits

    assign C[0] = 0; // Initial carry is 0

    // Generate terms
    assign G[0] = A[0] & B[0];
    assign G[1] = A[1] & B[1];
    assign G[2] = A[2] & B[2];
    assign G[3] = A[3] & B[3];

    // Propagate terms
    assign P[0] = A[0] ^ B[0];
    assign P[1] = A[1] ^ B[1];
    assign P[2] = A[2] ^ B[2];
    assign P[3] = A[3] ^ B[3];

    // Carry look-ahead logic
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);

    // Sum calculation
    assign Sum[0] = P[0] ^ C[0];
    assign Sum[1] = P[1] ^ C[1];
    assign Sum[2] = P[2] ^ C[2];
    assign Sum[3] = P[3] ^ C[3];

    // Final carry out
    assign Carry_Out = C[4];

endmodule
