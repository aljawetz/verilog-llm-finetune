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
        if (result1 !== 70) $display("FAIL: Test case 1, result1 incorrect");
        if (result2 !== 30) $display("FAIL: Test case 1, result2 incorrect");
        if (result3 !== 80) $display("FAIL: Test case 1, result3 incorrect");
        if (result4 !== 1500) $display("FAIL: Test case 1, result4 incorrect");
        if (result5 !== 5) $display("FAIL: Test case 1, result5 incorrect");
        if (result6 !== 150) $display("FAIL: Test case 1, result6 incorrect");

        // Test case 2
        A = 1; B = 1; C = 1; D = 1; E = 1; F = 1; G = 1; H = 1;
        #10;
        if (result1 !== 2) $display("FAIL: Test case 2, result1 incorrect");
        if (result2 !== 0) $display("FAIL: Test case 2, result2 incorrect");
        if (result3 !== 3) $display("FAIL: Test case 2, result3 incorrect");
        if (result4 !== 4) $display("FAIL: Test case 2, result4 incorrect");
        if (result5 !== 0) $display("FAIL: Test case 2, result5 incorrect");
        if (result6 !== 0) $display("FAIL: Test case 2, result6 incorrect");

        // Test case 3
        A = 0; B = 0; C = 0; D = 0; E = 0; F = 0; G = 0; H = 0;
        #10;
        if (result1 !== 0) $display("FAIL: Test case 3, result1 incorrect");
        if (result2 !== 0) $display("FAIL: Test case 3, result2 incorrect");
        if (result3 !== 0) $display("FAIL: Test case 3, result3 incorrect");
        if (result4 !== 0) $display("FAIL: Test case 3, result4 incorrect");
        if (result5 !== 0) $display("FAIL: Test case 3, result5 incorrect");
        if (result6 !== 0) $display("FAIL: Test case 3, result6 incorrect");

        // If all assertions pass
        $display("PASS");
        $finish;
    end

endmodule