`timescale 1ns/1ps

module tb_IC74139;

reg P1, P2, P3, P8, P13, P14, P15, P16;
wire P4, P5, P6, P7, P9, P10, P11, P12;

// Instantiate the module under test
IC74139 uut (
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
    .P14(P14),
    .P15(P15),
    .P16(P16)
);

initial begin
    // Initialize inputs
    P1 = 1; P2 = 0; P3 = 0; P8 = 1; P13 = 0; P14 = 0; P15 = 1; P16 = 1;
    
    // Test case 1: Check DEMUX 1 outputs when P1 is low
    P1 = 0; P2 = 0; P3 = 0; #10;
    if ({P4, P5, P6, P7} !== 4'b0111) $display("FAIL: Test case 1 failed");

    P2 = 1; #10;
    if ({P4, P5, P6, P7} !== 4'b1011) $display("FAIL: Test case 2 failed");

    P3 = 1; P2 = 0; #10;
    if ({P4, P5, P6, P7} !== 4'b1101) $display("FAIL: Test case 3 failed");

    P3 = 1; P2 = 1; #10;
    if ({P4, P5, P6, P7} !== 4'b1110) $display("FAIL: Test case 4 failed");

    // Test case 2: Check DEMUX 2 outputs when P15 is low
    P1 = 1; P15 = 0; P13 = 0; P14 = 0; #10;
    if ({P12, P11, P10, P9} !== 4'b0111) $display("FAIL: Test case 5 failed");

    P14 = 1; #10;
    if ({P12, P11, P10, P9} !== 4'b1011) $display("FAIL: Test case 6 failed");

    P13 = 1; P14 = 0; #10;
    if ({P12, P11, P10, P9} !== 4'b1101) $display("FAIL: Test case 7 failed");

    P13 = 1; P14 = 1; #10;
    if ({P12, P11, P10, P9} !== 4'b1110) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule