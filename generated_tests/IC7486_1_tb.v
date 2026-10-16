`timescale 1ns/1ps

module tb_IC7486;

reg P1, P2, P4, P5, P7, P9, P10, P12, P13, P14; // Inputs
wire P3, P6, P8, P11; // Outputs

// Instantiate the module under test (uut)
IC7486 uut (
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
    P1 = 0; P2 = 0; P4 = 0; P5 = 0; 
    P7 = 1; P9 = 0; P10 = 0; P12 = 0; P13 = 0; P14 = 1;

    // Test case 1
    #10;
    if (P3 !== (P1 ^ P2)) $display("FAIL: Test case 1 failed for P1=0, P2=0");
    if (P6 !== (P4 ^ P5)) $display("FAIL: Test case 1 failed for P4=0, P5=0");
    if (P8 !== (P9 ^ P10)) $display("FAIL: Test case 1 failed for P9=0, P10=0");
    if (P11 !== (P12 ^ P13)) $display("FAIL: Test case 1 failed for P12=0, P13=0");

    // Test case 2
    P1 = 1; P2 = 1; P4 = 1; P5 = 1; P9 = 1; P10 = 1; P12 = 1; P13 = 1;
    #10;
    if (P3 !== (P1 ^ P2)) $display("FAIL: Test case 2 failed for P1=1, P2=1");
    if (P6 !== (P4 ^ P5)) $display("FAIL: Test case 2 failed for P4=1, P5=1");
    if (P8 !== (P9 ^ P10)) $display("FAIL: Test case 2 failed for P9=1, P10=1");
    if (P11 !== (P12 ^ P13)) $display("FAIL: Test case 2 failed for P12=1, P13=1");

    // Test case 3
    P1 = 1; P2 = 0; P4 = 1; P5 = 0; P9 = 1; P10 = 0; P12 = 1; P13 = 0;
    #10;
    if (P3 !== (P1 ^ P2)) $display("FAIL: Test case 3 failed for P1=1, P2=0");
    if (P6 !== (P4 ^ P5)) $display("FAIL: Test case 3 failed for P4=1, P5=0");
    if (P8 !== (P9 ^ P10)) $display("FAIL: Test case 3 failed for P9=1, P10=0");
    if (P11 !== (P12 ^ P13)) $display("FAIL: Test case 3 failed for P12=1, P13=0");

    // Test case 4
    P1 = 0; P2 = 1; P4 = 0; P5 = 1; P9 = 0; P10 = 1; P12 = 0; P13 = 1;
    #10;
    if (P3 !== (P1 ^ P2)) $display("FAIL: Test case 4 failed for P1=0, P2=1");
    if (P6 !== (P4 ^ P5)) $display("FAIL: Test case 4 failed for P4=0, P5=1");
    if (P8 !== (P9 ^ P10)) $display("FAIL: Test case 4 failed for P9=0, P10=1");
    if (P11 !== (P12 ^ P13)) $display("FAIL: Test case 4 failed for P12=0, P13=1");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule