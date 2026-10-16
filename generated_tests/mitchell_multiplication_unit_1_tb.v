`timescale 1ns/1ps

module tb_mitchell_multiplication_unit;

    // Parameters
    parameter A_BW = 32;
    parameter B_BW = 32;

    // Inputs
    reg [$clog2(A_BW)-1:0] k_1;
    reg [$clog2(B_BW)-1:0] k_2;
    reg [A_BW-1:0] x_1;
    reg [B_BW-1:0] x_2;
    reg A_zero_flag;
    reg B_zero_flag;

    // Outputs
    wire [(A_BW+B_BW)-1:0] C;

    // Instantiate the Unit Under Test (UUT)
    mitchell_multiplication_unit #(A_BW, B_BW) uut (
        .k_1(k_1),
        .k_2(k_2),
        .x_1(x_1),
        .x_2(x_2),
        .A_zero_flag(A_zero_flag),
        .B_zero_flag(B_zero_flag),
        .C(C)
    );

    // Clock generation
    reg clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Test case 1: Normal multiplication
        k_1 = 3; k_2 = 2; x_1 = 32'h00000004; x_2 = 32'h00000002; A_zero_flag = 0; B_zero_flag = 0;
        #10;
        if (C !== 32'h00000008) $display("FAIL: Test case 1 failed, expected 8, got %h", C);

        // Test case 2: One operand zero
        k_1 = 3; k_2 = 2; x_1 = 32'h00000000; x_2 = 32'h00000002; A_zero_flag = 0; B_zero_flag = 0;
        #10;
        if (C !== 32'h00000000) $display("FAIL: Test case 2 failed, expected 0, got %h", C);

        // Test case 3: Both operands zero
        k_1 = 3; k_2 = 2; x_1 = 32'h00000000; x_2 = 32'h00000000; A_zero_flag = 0; B_zero_flag = 0;
        #10;
        if (C !== 32'h00000000) $display("FAIL: Test case 3 failed, expected 0, got %h", C);

        // Test case 4: Check for overflow
        k_1 = 3; k_2 = 3; x_1 = 32'hFFFFFFFF; x_2 = 32'hFFFFFFFF; A_zero_flag = 0; B_zero_flag = 0;
        #10;
        if (C !== 32'hFFFFFFFE) $display("FAIL: Test case 4 failed, expected FFFFFFFE, got %h", C);

        // Test case 5: Check with zero flags
        k_1 = 3; k_2 = 2; x_1 = 32'h00000004; x_2 = 32'h00000002; A_zero_flag = 1; B_zero_flag = 0;
        #10;
        if (C !== 32'h00000000) $display("FAIL: Test case 5 failed, expected 0, got %h", C);

        // Test case 6: Check with both zero flags
        k_1 = 3; k_2 = 2; x_1 = 32'h00000004; x_2 = 32'h00000002; A_zero_flag = 1; B_zero_flag = 1;
        #10;
        if (C !== 32'h00000000) $display("FAIL: Test case 6 failed, expected 0, got %h", C);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule