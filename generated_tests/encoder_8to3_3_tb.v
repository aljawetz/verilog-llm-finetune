`timescale 1ns/1ps

module tb_encoder_8to3;

reg A7, A6, A5, A4, A3, A2, A1, A0;
wire B, C, D;

// Instantiate the module under test
encoder_8to3 uut (
    .A7(A7),
    .A6(A6),
    .A5(A5),
    .A4(A4),
    .A3(A3),
    .A2(A2),
    .A1(A1),
    .A0(A0),
    .B(B),
    .C(C),
    .D(D)
);

initial begin
    // Test case 1: Only A0 is high
    A7 = 0; A6 = 0; A5 = 0; A4 = 0; A3 = 0; A2 = 0; A1 = 0; A0 = 1;
    #10;
    if (B !== 0 || C !== 0 || D !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: Only A1 is high
    A7 = 0; A6 = 0; A5 = 0; A4 = 0; A3 = 0; A2 = 0; A1 = 1; A0 = 0;
    #10;
    if (B !== 0 || C !== 0 || D !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: Only A2 is high
    A7 = 0; A6 = 0; A5 = 0; A4 = 0; A3 = 0; A2 = 1; A1 = 0; A0 = 0;
    #10;
    if (B !== 0 || C !== 1 || D !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: Only A3 is high
    A7 = 0; A6 = 0; A5 = 0; A4 = 0; A3 = 1; A2 = 0; A1 = 0; A0 = 0;
    #10;
    if (B !== 0 || C !== 1 || D !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: Only A4 is high
    A7 = 0; A6 = 0; A5 = 0; A4 = 1; A3 = 0; A2 = 0; A1 = 0; A0 = 0;
    #10;
    if (B !== 1 || C !== 0 || D !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: Only A5 is high
    A7 = 0; A6 = 0; A5 = 1; A4 = 0; A3 = 0; A2 = 0; A1 = 0; A0 = 0;
    #10;
    if (B !== 1 || C !== 0 || D !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: Only A6 is high
    A7 = 0; A6 = 1; A5 = 0; A4 = 0; A3 = 0; A2 = 0; A1 = 0; A0 = 0;
    #10;
    if (B !== 1 || C !== 1 || D !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: Only A7 is high
    A7 = 1; A6 = 0; A5 = 0; A4 = 0; A3 = 0; A2 = 0; A1 = 0; A0 = 0;
    #10;
    if (B !== 1 || C !== 1 || D !== 1) $display("FAIL: Test case 8 failed");

    // Test case 9: Multiple inputs high (A5, A3, A1)
    A7 = 0; A6 = 0; A5 = 1; A4 = 0; A3 = 1; A2 = 0; A1 = 1; A0 = 0;
    #10;
    if (B !== 1 || C !== 1 || D !== 1) $display("FAIL: Test case 9 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule