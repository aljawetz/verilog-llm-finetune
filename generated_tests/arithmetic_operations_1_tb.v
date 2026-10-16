`timescale 1ns/1ps

module tb_arithmetic_operations;

    reg [31:0] A, B, C, D, E, F, G, H;
    wire [31:0] result1, result2, result3, result4, result5, result6;

    // Instantiate the module under test (uut)
    arithmetic_operations uut (
        .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .H(H),
        .result1(result1), .result2(result2), .result3(result3),
        .result4(result4), .result5(result5), .result6(result6)
    );

    initial begin
        // Test case 1
        A = 2; B = 3; C = 4; D = 5; E = 10; F = 1; G = 6; H = 7;
        #10;
        if (result1 !== 45) $display("FAIL: Test case 1, result1 expected 45 but got %d", result1);
        if (result2 !== 23) $display("FAIL: Test case 1, result2 expected 23 but got %d", result2);
        if (result3 !== 22) $display("FAIL: Test case 1, result3 expected 22 but got %d", result3);
        if (result4 !== 225) $display("FAIL: Test case 1, result4 expected 225 but got %d", result4);
        if (result5 !== 10) $display("FAIL: Test case 1, result5 expected 10 but got %d", result5);
        if (result6 !== 15) $display("FAIL: Test case 1, result6 expected 15 but got %d", result6);

        // Test case 2
        A = 1; B = 1; C = 1; D = 1; E = 1; F = 1; G = 1; H = 1;
        #10;
        if (result1 !== 3) $display("FAIL: Test case 2, result1 expected 3 but got %d", result1);
        if (result2 !== 0) $display("FAIL: Test case 2, result2 expected 0 but got %d", result2);
        if (result3 !== 3) $display("FAIL: Test case 2, result3 expected 3 but got %d", result3);
        if (result4 !== 0) $display("FAIL: Test case 2, result4 expected 0 but got %d", result4);
        if (result5 !== 1) $display("FAIL: Test case 2, result5 expected 1 but got %d", result5);
        if (result6 !== 0) $display("FAIL: Test case 2, result6 expected 0 but got %d", result6);

        // Test case 3
        A = 10; B = 20; C = 30; D = 40; E = 50; F = 60; G = 70; H = 80;
        #10;
        if (result1 !== 2400) $display("FAIL: Test case 3, result1 expected 2400 but got %d", result1);
        if (result2 !== 1240) $display("FAIL: Test case 3, result2 expected 1240 but got %d", result2);
        if (result3 !== 110) $display("FAIL: Test case 3, result3 expected 110 but got %d", result3);
        if (result4 !== 24000) $display("FAIL: Test case 3, result4 expected 24000 but got %d", result4);
        if (result5 !== 590) $display("FAIL: Test case 3, result5 expected 590 but got %d", result5);
        if (result6 !== -10) $display("FAIL: Test case 3, result6 expected -10 but got %d", result6);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule