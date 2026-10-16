`timescale 1ns/1ps

module tb_divisible_n;

    parameter MOD = 5;
    reg clk;
    reg rst;
    reg in;
    wire out;

    // Instantiate the module under test (uut)
    divisible_n #(.MOD(MOD)) uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        in = 0;
        #10; // Wait for 10ns
        rst = 0;

        // Test case 1: Check divisibility by 5
        // Input sequence: 0, 0, 0, 0, 1 (binary 00001 = 1)
        in = 0; #10; // div = 0
        in = 0; #10; // div = 0
        in = 0; #10; // div = 0
        in = 0; #10; // div = 0
        in = 1; #10; // div = 1
        if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);

        // Test case 2: Check divisibility by 5
        // Input sequence: 1, 1, 1, 1, 1 (binary 11111 = 31)
        in = 1; #10; // div = 3
        in = 1; #10; // div = 7
        in = 1; #10; // div = 15
        in = 1; #10; // div = 31
        if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);

        // Test case 3: Check divisibility by 5
        // Input sequence: 1, 0, 0, 0, 0 (binary 10000 = 16)
        in = 1; #10; // div = 1
        in = 0; #10; // div = 2
        in = 0; #10; // div = 4
        in = 0; #10; // div = 8
        in = 0; #10; // div = 16
        if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);

        // Test case 4: Check divisibility by 5
        // Input sequence: 1, 1, 1, 1, 0 (binary 11110 = 30)
        in = 1; #10; // div = 1
        in = 1; #10; // div = 3
        in = 1; #10; // div = 7
        in = 1; #10; // div = 15
        in = 0; #10; // div = 30
        if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);

        // Test case 5: Reset functionality
        rst = 1; #10; // Reset the module
        rst = 0; #10; // Release reset
        if (out !== 0) $display("FAIL: Expected out = 0 after reset, got %b", out);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule