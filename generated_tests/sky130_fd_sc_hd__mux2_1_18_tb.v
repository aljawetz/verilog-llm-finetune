`timescale 1ns/1ps

module tb_mux2_1;

// Inputs
reg [0:0] A1;
reg [0:0] A0;
reg [0:0] S;

// Output
wire [0:0] X;

// Instantiate the Unit Under Test (UUT)
sky130_fd_sc_hd__mux2_1 uut (
    .A1(A1),
    .A0(A0),
    .S(S),
    .X(X)
);

initial begin
    // Initialize Inputs
    A1 = 0;
    A0 = 0;
    S = 0;

    // Test case 1: Select A0 when S = 0
    A0 = 1; A1 = 0; S = 0; #10;
    if (X !== A0) $display("FAIL: Test case 1 failed, expected X = %b, got X = %b", A0, X);

    // Test case 2: Select A1 when S = 1
    A0 = 0; A1 = 1; S = 1; #10;
    if (X !== A1) $display("FAIL: Test case 2 failed, expected X = %b, got X = %b", A1, X);

    // Test case 3: Select A0 when S = 0
    A0 = 1; A1 = 1; S = 0; #10;
    if (X !== A0) $display("FAIL: Test case 3 failed, expected X = %b, got X = %b", A0, X);

    // Test case 4: Select A1 when S = 1
    A0 = 0; A1 = 1; S = 1; #10;
    if (X !== A1) $display("FAIL: Test case 4 failed, expected X = %b, got X = %b", A1, X);

    // Test case 5: Both inputs are the same
    A0 = 1; A1 = 1; S = 0; #10;
    if (X !== A0) $display("FAIL: Test case 5 failed, expected X = %b, got X = %b", A0, X);

    // Test case 6: Both inputs are the same
    A0 = 1; A1 = 1; S = 1; #10;
    if (X !== A1) $display("FAIL: Test case 6 failed, expected X = %b, got X = %b", A1, X);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule