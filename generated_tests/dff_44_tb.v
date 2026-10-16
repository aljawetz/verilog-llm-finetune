`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .q(q),
        .d(d),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1; d = 0;
        #10; // Wait for a clock cycle
        if (q !== 0) $display("FAIL: Initial reset failed");

        // Release reset
        rst = 0;
        #10; // Wait for a clock cycle

        // Test setting d = 1
        d = 1;
        #10; // Wait for a clock cycle
        if (q !== 1) $display("FAIL: D flip-flop did not set to 1");

        // Test setting d = 0
        d = 0;
        #10; // Wait for a clock cycle
        if (q !== 0) $display("FAIL: D flip-flop did not reset to 0");

        // Test with multiple clock cycles
        d = 1;
        #10; // Wait for a clock cycle
        if (q !== 1) $display("FAIL: D flip-flop did not hold 1");

        d = 0;
        #10; // Wait for a clock cycle
        if (q !== 0) $display("FAIL: D flip-flop did not hold 0");

        // Final check
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (q !== 0) $display("FAIL: D flip-flop did not reset to 0 on reset");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule