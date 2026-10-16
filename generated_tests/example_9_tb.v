`timescale 1ns/1ps

module tb_example;

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
    wire [31:0] result4;
    wire [31:0] result5;
    wire [31:0] result6;

    // Instantiate the Unit Under Test (UUT)
    example uut (
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
        .result3(result3), 
        .result4(result4), 
        .result5(result5), 
        .result6(result6)
    );

    initial begin
        // Test case 1
        A = 32'd10; B = 32'd20; C = 32'd2; D = 32'd5; E = 32'd15; F = 32'd5; G = 32'd3; H = 32'd1;
        #10;
        if (result1 !== 32'd100) $display("FAIL: Test case 1, result1 expected 100 but got %d", result1);
        if (result2 !== 32'd95) $display("FAIL: Test case 1, result2 expected 95 but got %d", result2);
        if (result3 !== 32'd33) $display("FAIL: Test case 1, result3 expected 33 but got %d", result3);
        if (result4 !== 32'd250) $display("FAIL: Test case 1, result4 expected 250 but got %d", result4);
        if (result5 !== 32'd15) $display("FAIL: Test case 1, result5 expected 15 but got %d", result5);
        if (result6 !== 32'd0) $display("FAIL: Test case 1, result6 expected 0 but got %d", result6);

        // Test case 2
        A = 32'd1; B = 32'd1; C = 32'd1; D = 32'd1; E = 32'd1; F = 32'd1; G = 32'd1; H = 32'd1;
        #10;
        if (result1 !== 32'd2) $display("FAIL: Test case 2, result1 expected 2 but got %d", result1);
        if (result2 !== 32'd1) $display("FAIL: Test case 2, result2 expected 1 but got %d", result2);
        if (result3 !== 32'd3) $display("FAIL: Test case 2, result3 expected 3 but got %d", result3);
        if (result4 !== 32'd2) $display("FAIL: Test case 2, result4 expected 2 but got %d", result4);
        if (result5 !== 32'd0) $display("FAIL: Test case 2, result5 expected 0 but got %d", result5);
        if (result6 !== 32'd0) $display("FAIL: Test case 2, result6 expected 0 but got %d", result6);

        // Test case 3
        A = 32'd0; B = 32'd0; C = 32'd0; D = 32'd0; E = 32'd0; F = 32'd0; G = 32'd0; H = 32'd0;
        #10;
        if (result1 !== 32'd0) $display("FAIL: Test case 3, result1 expected 0 but got %d", result1);
        if (result2 !== 32'd0) $display("FAIL: Test case 3, result2 expected 0 but got %d", result2);
        if (result3 !== 32'd0) $display("FAIL: Test case 3, result3 expected 0 but got %d", result3);
        if (result4 !== 32'd0) $display("FAIL: Test case 3, result4 expected 0 but got %d", result4);
        if (result5 !== 32'd0) $display("FAIL: Test case 3, result5 expected 0 but got %d", result5);
        if (result6 !== 32'd0) $display("FAIL: Test case 3, result6 expected 0 but got %d", result6);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule