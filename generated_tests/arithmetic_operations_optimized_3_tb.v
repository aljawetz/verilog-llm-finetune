`timescale 1ns/1ps

module tb_arithmetic_operations_optimized;

    reg [31:0] A, B, C, D, E, F, G, H;
    wire [31:0] result1, result2, result3;

    // Instantiate the module under test (uut)
    arithmetic_operations_optimized uut (
        .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .H(H),
        .result1(result1), .result2(result2), .result3(result3)
    );

    initial begin
        // Test case 1
        A = 10; B = 20; C = 2; D = 5; E = 30; F = 10; G = 5; H = 15;
        #10;
        if (result1 !== (A + B) + (C * D)) begin
            $display("FAIL: Test case 1 - result1 mismatch");
            $finish;
        end
        if (result2 !== (C * D) + (E - F)) begin
            $display("FAIL: Test case 1 - result2 mismatch");
            $finish;
        end
        if (result3 !== (A + B) + G + H) begin
            $display("FAIL: Test case 1 - result3 mismatch");
            $finish;
        end

        // Test case 2
        A = 0; B = 0; C = 0; D = 0; E = 0; F = 0; G = 0; H = 0;
        #10;
        if (result1 !== 0) begin
            $display("FAIL: Test case 2 - result1 mismatch");
            $finish;
        end
        if (result2 !== 0) begin
            $display("FAIL: Test case 2 - result2 mismatch");
            $finish;
        end
        if (result3 !== 0) begin
            $display("FAIL: Test case 2 - result3 mismatch");
            $finish;
        end

        // Test case 3
        A = 100; B = 200; C = 3; D = 4; E = 50; F = 25; G = 10; H = 5;
        #10;
        if (result1 !== (A + B) + (C * D)) begin
            $display("FAIL: Test case 3 - result1 mismatch");
            $finish;
        end
        if (result2 !== (C * D) + (E - F)) begin
            $display("FAIL: Test case 3 - result2 mismatch");
            $finish;
        end
        if (result3 !== (A + B) + G + H) begin
            $display("FAIL: Test case 3 - result3 mismatch");
            $finish;
        end

        // Test case 4
        A = 15; B = 25; C = 6; D = 7; E = 100; F = 50; G = 20; H = 30;
        #10;
        if (result1 !== (A + B) + (C * D)) begin
            $display("FAIL: Test case 4 - result1 mismatch");
            $finish;
        end
        if (result2 !== (C * D) + (E - F)) begin
            $display("FAIL: Test case 4 - result2 mismatch");
            $finish;
        end
        if (result3 !== (A + B) + G + H) begin
            $display("FAIL: Test case 4 - result3 mismatch");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule