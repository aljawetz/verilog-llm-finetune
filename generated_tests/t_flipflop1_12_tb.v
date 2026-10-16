`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the module under test (uut)
    t_flipflop1 uut (
        .t(t),
        .clk(clk),
        .rst(rst),
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
        rst = 1; // Assert reset
        t = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: T = 0, expect Q to remain 0
        t = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected Q=0 when T=0");
            $finish;
        end

        // Test case 2: T = 1, expect Q to toggle
        t = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: Expected Q=1 when T=1");
            $finish;
        end

        // Test case 3: T = 0, expect Q to remain 1
        t = 0;
        #10;
        if (q !== 1) begin
            $display("FAIL: Expected Q=1 when T=0 after toggling");
            $finish;
        end

        // Test case 4: T = 1, expect Q to toggle
        t = 1;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected Q=0 when T=1 after toggling");
            $finish;
        end

        // Test case 5: Assert reset, expect Q to be 0
        rst = 1;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected Q=0 after reset");
            $finish;
        end

        // Test case 6: Release reset and T = 1, expect Q to toggle
        rst = 0;
        t = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: Expected Q=1 when T=1 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule