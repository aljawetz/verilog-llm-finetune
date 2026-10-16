`timescale 1ns/1ps

module tb_arithmetic_operations;

    reg [31:0] A, B, C, D, E, F, G, H;
    wire [31:0] result1, result2, result3, result4, result5, result6;

    // Instantiate the module under test
    arithmetic_operations uut (
        .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .H(H),
        .result1(result1), .result2(result2), .result3(result3),
        .result4(result4), .result5(result5), .result6(result6)
    );

    initial begin
        // Test case 1
        A = 2; B = 3; C = 4; D = 5; E = 6; F = 7; G = 8; H = 9;
        #10;
        if (result1 !== (A + B + C) * D) $display("FAIL: Test case 1, result1 mismatch");
        if (result2 !== (D * C) + (E - F)) $display("FAIL: Test case 1, result2 mismatch");
        if (result3 !== (A + (B + G)) + H) $display("FAIL: Test case 1, result3 mismatch");
        if (result4 !== ((D * C) + E) * (A + B)) $display("FAIL: Test case 1, result4 mismatch");
        if (result5 !== (C * D + B) - A) $display("FAIL: Test case 1, result5 mismatch");
        if (result6 !== (A + C + B) * (E - F)) $display("FAIL: Test case 1, result6 mismatch");

        // Test case 2
        A = 10; B = 20; C = 30; D = 40; E = 50; F = 60; G = 70; H = 80;
        #10;
        if (result1 !== (A + B + C) * D) $display("FAIL: Test case 2, result1 mismatch");
        if (result2 !== (D * C) + (E - F)) $display("FAIL: Test case 2, result2 mismatch");
        if (result3 !== (A + (B + G)) + H) $display("FAIL: Test case 2, result3 mismatch");
        if (result4 !== ((D * C) + E) * (A + B)) $display("FAIL: Test case 2, result4 mismatch");
        if (result5 !== (C * D + B) - A) $display("FAIL: Test case 2, result5 mismatch");
        if (result6 !== (A + C + B) * (E - F)) $display("FAIL: Test case 2, result6 mismatch");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule