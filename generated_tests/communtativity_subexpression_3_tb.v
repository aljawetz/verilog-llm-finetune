`timescale 1ns/1ps

module tb_communtativity_subexpression;

    reg [31:0] A, B, C, D, E, F, G, H;
    wire [31:0] result1, result2, result3, result4, result5, result6;

    // Instantiate the module under test
    communtativity_subexpression uut (
        .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .H(H),
        .result1(result1), .result2(result2), .result3(result3),
        .result4(result4), .result5(result5), .result6(result6)
    );

    initial begin
        // Test case 1
        A = 10; B = 20; C = 2; D = 5; E = 15; F = 5; G = 3; H = 7;
        #10;
        if (result1 !== 70) $display("FAIL: Test case 1, result1 expected 70, got %d", result1);
        if (result2 !== 65) $display("FAIL: Test case 1, result2 expected 65, got %d", result2);
        if (result3 !== 80) $display("FAIL: Test case 1, result3 expected 80, got %d", result3);
        if (result4 !== 1500) $display("FAIL: Test case 1, result4 expected 1500, got %d", result4);
        if (result5 !== 5) $display("FAIL: Test case 1, result5 expected 5, got %d", result5);
        if (result6 !== 200) $display("FAIL: Test case 1, result6 expected 200, got %d", result6);

        // Test case 2
        A = 1; B = 1; C = 1; D = 1; E = 1; F = 1; G = 1; H = 1;
        #10;
        if (result1 !== 2) $display("FAIL: Test case 2, result1 expected 2, got %d", result1);
        if (result2 !== 0) $display("FAIL: Test case 2, result2 expected 0, got %d", result2);
        if (result3 !== 3) $display("FAIL: Test case 2, result3 expected 3, got %d", result3);
        if (result4 !== 4) $display("FAIL: Test case 2, result4 expected 4, got %d", result4);
        if (result5 !== 0) $display("FAIL: Test case 2, result5 expected 0, got %d", result5);
        if (result6 !== 0) $display("FAIL: Test case 2, result6 expected 0, got %d", result6);

        // Test case 3
        A = 0; B = 0; C = 0; D = 0; E = 0; F = 0; G = 0; H = 0;
        #10;
        if (result1 !== 0) $display("FAIL: Test case 3, result1 expected 0, got %d", result1);
        if (result2 !== 0) $display("FAIL: Test case 3, result2 expected 0, got %d", result2);
        if (result3 !== 0) $display("FAIL: Test case 3, result3 expected 0, got %d", result3);
        if (result4 !== 0) $display("FAIL: Test case 3, result4 expected 0, got %d", result4);
        if (result5 !== 0) $display("FAIL: Test case 3, result5 expected 0, got %d", result5);
        if (result6 !== 0) $display("FAIL: Test case 3, result6 expected 0, got %d", result6);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule