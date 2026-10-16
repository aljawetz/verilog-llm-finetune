`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the T flip-flop module
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
        rst = 1; // Start with reset active
        t = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10; // Wait for 10ns

        // Test case 1: T = 0, should not toggle
        t = 0;
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q=0 when t=0");
            $finish;
        end

        // Test case 2: T = 1, should toggle
        t = 1;
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: Expected q=1 when t=1");
            $finish;
        end

        // Test case 3: T = 0, should not toggle
        t = 0;
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: Expected q=1 when t=0");
            $finish;
        end

        // Test case 4: T = 1, should toggle
        t = 1;
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q=0 when t=1");
            $finish;
        end

        // Test case 5: Assert reset functionality
        rst = 1; // Activate reset
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after reset");
            $finish;
        end

        // Test case 6: Release reset and toggle
        rst = 0;
        t = 1;
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: Expected q=1 after reset released and t=1");
            $finish;
        end

        // Test case 7: Toggle again
        t = 0;
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: Expected q=1 when t=0");
            $finish;
        end

        // Test case 8: Final toggle
        t = 1;
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q=0 when t=1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule