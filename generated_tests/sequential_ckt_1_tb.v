`timescale 1ns/1ps

module tb_sequential_ckt;

    reg A;
    reg B;
    reg C;
    reg rst;
    reg clk;
    wire Z;

    // Instantiate the module under test (uut)
    sequential_ckt uut (
        .A(A),
        .B(B),
        .C(C),
        .rst(rst),
        .clk(clk),
        .Z(Z)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        A = 0; B = 0; C = 0; rst = 1;
        
        // Apply reset
        #10;
        rst = 0;

        // Test case 1: A=0, B=0, C=0
        #10;
        if (Z !== 1'b1) $display("FAIL: Test case 1 failed, expected Z=1, got Z=%b", Z);

        // Test case 2: A=1, B=0, C=0
        A = 1; B = 0; C = 0;
        #10;
        if (Z !== 1'b1) $display("FAIL: Test case 2 failed, expected Z=1, got Z=%b", Z);

        // Test case 3: A=0, B=1, C=0
        A = 0; B = 1; C = 0;
        #10;
        if (Z !== 1'b1) $display("FAIL: Test case 3 failed, expected Z=1, got Z=%b", Z);

        // Test case 4: A=1, B=1, C=0
        A = 1; B = 1; C = 0;
        #10;
        if (Z !== 1'b1) $display("FAIL: Test case 4 failed, expected Z=1, got Z=%b", Z);

        // Test case 5: A=0, B=0, C=1
        A = 0; B = 0; C = 1;
        #10;
        if (Z !== 1'b0) $display("FAIL: Test case 5 failed, expected Z=0, got Z=%b", Z);

        // Test case 6: A=1, B=0, C=1
        A = 1; B = 0; C = 1;
        #10;
        if (Z !== 1'b0) $display("FAIL: Test case 6 failed, expected Z=0, got Z=%b", Z);

        // Test case 7: A=0, B=1, C=1
        A = 0; B = 1; C = 1;
        #10;
        if (Z !== 1'b0) $display("FAIL: Test case 7 failed, expected Z=0, got Z=%b", Z);

        // Test case 8: A=1, B=1, C=1
        A = 1; B = 1; C = 1;
        #10;
        if (Z !== 1'b0) $display("FAIL: Test case 8 failed, expected Z=0, got Z=%b", Z);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule