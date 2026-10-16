`timescale 1ns/1ps

module tb_bidirectionalB;

    reg clk;
    reg rst;
    reg dir;
    reg d;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    bidirectionalB uut (
        .clk(clk),
        .rst(rst),
        .dir(dir),
        .d(d),
        .q(q)
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
        dir = 0;
        d = 0;

        // Apply reset
        #10;
        rst = 0; // Release reset

        // Test shifting left
        dir = 0; // Set direction to left
        d = 1;   // Input data
        #10;     // Wait for one clock cycle
        if (q !== 4'b0001) $display("FAIL: Expected q = 0001, got q = %b", q);

        d = 0;   // Input data
        #10;     // Wait for one clock cycle
        if (q !== 4'b0010) $display("FAIL: Expected q = 0010, got q = %b", q);

        d = 1;   // Input data
        #10;     // Wait for one clock cycle
        if (q !== 4'b0101) $display("FAIL: Expected q = 0101, got q = %b", q);

        // Test shifting right
        dir = 1; // Set direction to right
        d = 1;   // Input data
        #10;     // Wait for one clock cycle
        if (q !== 4'b1010) $display("FAIL: Expected q = 1010, got q = %b", q);

        d = 0;   // Input data
        #10;     // Wait for one clock cycle
        if (q !== 4'b0100) $display("FAIL: Expected q = 0100, got q = %b", q);

        // Test reset functionality
        rst = 1; // Assert reset
        #10;
        if (q !== 4'b0000) $display("FAIL: Expected q = 0000 after reset, got q = %b", q);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule