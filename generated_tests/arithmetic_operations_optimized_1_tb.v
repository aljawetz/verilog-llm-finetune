`timescale 1ns/1ps

module tb_arithmetic_operations_optimized;

    // Inputs
    reg [31:0] A;
    reg [31:0] B;
    reg [31:0] C;
    reg [31:0] D;
    reg [31:0] E;
    reg [31:0] F;
    reg [31:0] G;
    reg [31:0] H;

    // Outputs
    wire [31:0] result1;
    wire [31:0] result2;
    wire [31:0] result3;

    // Instantiate the Unit Under Test (UUT)
    arithmetic_operations_optimized uut (
        .A(A), 
        .B(B), 
        .C(C), 
        .D(D), 
        .E(E), 
        .F(F), 
        .G(G), 
        .H(H), 
        .result1(result1), 
        .result2(result2), 
        .result3(result3)
    );

    initial begin
        // Test case 1
        A = 32'd5; B = 32'd10; C = 32'd2; D = 32'd3; E = 32'd20; F = 32'd5; G = 32'd1; H = 32'd4;
        #10;
        if (result1 !== (A + B + C * D)) begin
            $display("FAIL: Test case 1, result1 mismatch");
            $finish;
        end
        if (result2 !== (C * D + (E - F))) begin
            $display("FAIL: Test case 1, result2 mismatch");
            $finish;
        end
        if (result3 !== ((A + B) + G + H)) begin
            $display("FAIL: Test case 1, result3 mismatch");
            $finish;
        end

        // Test case 2
        A = 32'd0; B = 32'd0; C = 32'd0; D = 32'd0; E = 32'd0; F = 32'd0; G = 32'd0; H = 32'd0;
        #10;
        if (result1 !== 32'd0) begin
            $display("FAIL: Test case 2, result1 mismatch");
            $finish;
        end
        if (result2 !== 32'd0) begin
            $display("FAIL: Test case 2, result2 mismatch");
            $finish;
        end
        if (result3 !== 32'd0) begin
            $display("FAIL: Test case 2, result3 mismatch");
            $finish;
        end

        // Test case 3
        A = 32'd1; B = 32'd1; C = 32'd1; D = 32'd1; E = 32'd2; F = 32'd1; G = 32'd1; H = 32'd1;
        #10;
        if (result1 !== (A + B + C * D)) begin
            $display("FAIL: Test case 3, result1 mismatch");
            $finish;
        end
        if (result2 !== (C * D + (E - F))) begin
            $display("FAIL: Test case 3, result2 mismatch");
            $finish;
        end
        if (result3 !== ((A + B) + G + H)) begin
            $display("FAIL: Test case 3, result3 mismatch");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule