`timescale 1ns/1ps

module tb_IC7408;

reg P1, P2, P4, P5, P7, P9, P10, P12, P13, P14;
wire P3, P6, P8, P11;

// Instantiate the module under test
IC7408 uut (
    .P1(P1),
    .P2(P2),
    .P3(P3),
    .P4(P4),
    .P5(P5),
    .P6(P6),
    .P7(P7),
    .P8(P8),
    .P9(P9),
    .P10(P10),
    .P11(P11),
    .P12(P12),
    .P13(P13),
    .P14(P14)
);

initial begin
    // Initialize inputs
    P1 = 0; P2 = 0; P4 = 0; P5 = 0; P7 = 0; 
    P9 = 0; P10 = 0; P12 = 0; P13 = 0; P14 = 1; // P14 is supply

    // Test case 1: Check AND gate outputs
    // P1 & P2 = 0 & 0 = 0
    #10;
    if (P3 !== 0) $display("FAIL: Test case 1 failed, expected P3 = 0, got %b", P3);
    
    // P4 & P5 = 0 & 0 = 0
    if (P6 !== 0) $display("FAIL: Test case 1 failed, expected P6 = 0, got %b", P6);
    
    // P9 & P10 = 0 & 0 = 0
    if (P8 !== 0) $display("FAIL: Test case 1 failed, expected P8 = 0, got %b", P8);
    
    // P12 & P13 = 0 & 0 = 0
    if (P11 !== 0) $display("FAIL: Test case 1 failed, expected P11 = 0, got %b", P11);

    // Test case 2: Check all outputs with inputs set to 1
    P1 = 1; P2 = 1; P4 = 1; P5 = 1; P9 = 1; P10 = 1; P12 = 1; P13 = 1;
    #10;
    if (P3 !== 1) $display("FAIL: Test case 2 failed, expected P3 = 1, got %b", P3);
    if (P6 !== 1) $display("FAIL: Test case 2 failed, expected P6 = 1, got %b", P6);
    if (P8 !== 1) $display("FAIL: Test case 2 failed, expected P8 = 1, got %b", P8);
    if (P11 !== 1) $display("FAIL: Test case 2 failed, expected P11 = 1, got %b", P11);

    // Test case 3: Mixed inputs
    P1 = 1; P2 = 0; P4 = 1; P5 = 0; P9 = 1; P10 = 0; P12 = 1; P13 = 0;
    #10;
    if (P3 !== 0) $display("FAIL: Test case 3 failed, expected P3 = 0, got %b", P3);
    if (P6 !== 0) $display("FAIL: Test case 3 failed, expected P6 = 0, got %b", P6);
    if (P8 !== 0) $display("FAIL: Test case 3 failed, expected P8 = 0, got %b", P8);
    if (P11 !== 0) $display("FAIL: Test case 3 failed, expected P11 = 0, got %b", P11);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule