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
        t = 0;
        rst = 1; // Start with reset active
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: T = 0, should not toggle
        t = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0 when t=0");
            $finish;
        end

        // Test case 2: T = 1, should toggle
        t = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: Expected q=1 when t=1 and q was 0");
            $finish;
        end

        // Test case 3: T = 1, should toggle again
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0 when t=1 and q was 1");
            $finish;
        end

        // Test case 4: T = 0, should not toggle
        t = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0 when t=0");
            $finish;
        end

        // Test case 5: Assert reset functionality
        rst = 1; // Assert reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0 when reset is active");
            $finish;
        end

        // Test case 6: Release reset and toggle
        rst = 0;
        t = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: Expected q=1 after reset released and t=1");
            $finish;
        end

        // Test case 7: Toggle again
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after toggle");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule