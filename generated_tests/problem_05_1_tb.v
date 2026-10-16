`timescale 1ns/1ps

module tb_problem_05;

reg A, B, C, CLK, CLR;
wire Q;

// Instantiate the module under test
problem_05 uut (
    .A(A),
    .B(B),
    .C(C),
    .CLK(CLK),
    .CLR(CLR),
    .Q(Q)
);

// Clock generation
initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns period
end

// Test sequence
initial begin
    // Initialize inputs
    A = 0; B = 0; C = 0; CLR = 1;
    #10; // Wait for 10ns
    CLR = 0; // Release reset

    // Test case 1: A=0, B=0, C=0
    #10;
    if (Q !== 0) $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", Q);

    // Test case 2: A=1, B=0, C=0
    A = 1; B = 0; C = 0;
    #10;
    if (Q !== 0) $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", Q);

    // Test case 3: A=1, B=1, C=0
    A = 1; B = 1; C = 0;
    #10;
    if (Q !== 1) $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", Q);

    // Test case 4: A=0, B=1, C=0
    A = 0; B = 1; C = 0;
    #10;
    if (Q !== 0) $display("FAIL: Test case 4 failed, expected Q=0, got Q=%b", Q);

    // Test case 5: A=1, B=0, C=1
    A = 1; B = 0; C = 1;
    #10;
    if (Q !== 1) $display("FAIL: Test case 5 failed, expected Q=1, got Q=%b", Q);

    // Test case 6: A=0, B=1, C=1
    A = 0; B = 1; C = 1;
    #10;
    if (Q !== 1) $display("FAIL: Test case 6 failed, expected Q=1, got Q=%b", Q);

    // Test case 7: A=1, B=1, C=1
    A = 1; B = 1; C = 1;
    #10;
    if (Q !== 1) $display("FAIL: Test case 7 failed, expected Q=1, got Q=%b", Q);

    // Test case 8: A=0, B=0, C=1
    A = 0; B = 0; C = 1;
    #10;
    if (Q !== 0) $display("FAIL: Test case 8 failed, expected Q=0, got Q=%b", Q);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule