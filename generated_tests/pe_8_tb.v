`timescale 1ns/1ps

module tb_pe;

    // Testbench signals
    reg clk;
    reg rst;
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] c;

    // Instantiate the module under test (uut)
    pe uut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .c(c)
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
        a = 0;
        b = 0;

        // Release reset
        #10;
        rst = 0;

        // Test case 1: Simple multiplication and accumulation
        a = 32'd3;
        b = 32'd4; // 3 * 4 = 12
        #10; // Wait for one clock cycle
        if (c !== 32'd12) $display("FAIL: Expected c = 12, got c = %d", c);

        // Test case 2: Accumulate another value
        a = 32'd2;
        b = 32'd5; // 2 * 5 = 10
        #10; // Wait for one clock cycle
        if (c !== 32'd22) $display("FAIL: Expected c = 22, got c = %d", c);

        // Test case 3: Reset functionality
        rst = 1;
        #10; // Wait for reset to take effect
        if (c !== 32'd0) $display("FAIL: Expected c = 0 after reset, got c = %d", c);
        
        // Test case 4: After reset, check accumulation
        rst = 0;
        a = 32'd1;
        b = 32'd1; // 1 * 1 = 1
        #10; // Wait for one clock cycle
        if (c !== 32'd1) $display("FAIL: Expected c = 1, got c = %d", c);

        // Test case 5: Larger values
        a = 32'd100000;
        b = 32'd200000; // 100000 * 200000 = 20000000000
        #10; // Wait for one clock cycle
        if (c !== 32'd1000001) $display("FAIL: Expected c = 1000001, got c = %d", c); // 1 + 10000000000

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule