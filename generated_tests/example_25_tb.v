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
        // Test Case 1
        A = 32'd1; B = 32'd2; C = 32'd3; D = 32'd4; 
        E = 32'd5; F = 32'd6; G = 32'd7; H = 32'd8;
        #10;
        if (result1 !== 32'd15) $display("FAIL: Test Case 1, result1 expected 15 but got %d", result1);
        if (result2 !== 32'd13) $display("FAIL: Test Case 1, result2 expected 13 but got %d", result2);
        if (result3 !== 32'd22) $display("FAIL: Test Case 1, result3 expected 22 but got %d", result3);
        if (result4 !== 32'd60) $display("FAIL: Test Case 1, result4 expected 60 but got %d", result4);
        if (result5 !== 32'd0) $display("FAIL: Test Case 1, result5 expected 0 but got %d", result5);
        if (result6 !== 32'd12) $display("FAIL: Test Case 1, result6 expected 12 but got %d", result6);

        // Test Case 2
        A = 32'd10; B = 32'd20; C = 32'd30; D = 32'd40; 
        E = 32'd50; F = 32'd60; G = 32'd70; H = 32'd80;
        #10;
        if (result1 !== 32'd900) $display("FAIL: Test Case 2, result1 expected 900 but got %d", result1);
        if (result2 !== 32'd880) $display("FAIL: Test Case 2, result2 expected 880 but got %d", result2);
        if (result3 !== 32'd150) $display("FAIL: Test Case 2, result3 expected 150 but got %d", result3);
        if (result4 !== 32'd2400) $display("FAIL: Test Case 2, result4 expected 2400 but got %d", result4);
        if (result5 !== 32'd0) $display("FAIL: Test Case 2, result5 expected 0 but got %d", result5);
        if (result6 !== 32'd600) $display("FAIL: Test Case 2, result6 expected 600 but got %d", result6);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule