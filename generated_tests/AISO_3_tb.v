`timescale 1ns/1ps

module tb_AISO;

    // Testbench signals
    reg clk;
    reg reset;
    wire reset_sync;

    // Instantiate the module under test (uut)
    AISO uut (
        .clk(clk),
        .reset(reset),
        .reset_sync(reset_sync)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 0;

        // Wait for a clock cycle
        #10;

        // Test case 1: Assert reset
        reset = 1; // Activate reset
        #10; // Wait for two clock cycles
        reset = 0; // Deactivate reset
        #10; // Wait for one clock cycle

        // Check reset_sync should be high for one clock cycle
        if (reset_sync !== 1) begin
            $display("FAIL: reset_sync should be high after reset deactivation");
            $finish;
        end
        #10; // Wait for next clock cycle

        // Check reset_sync should be low after the pulse
        if (reset_sync !== 0) begin
            $display("FAIL: reset_sync should be low after the pulse");
            $finish;
        end

        // Test case 2: Assert reset again
        reset = 1; // Activate reset
        #10; // Wait for two clock cycles
        reset = 0; // Deactivate reset
        #10; // Wait for one clock cycle

        // Check reset_sync should be high for one clock cycle
        if (reset_sync !== 1) begin
            $display("FAIL: reset_sync should be high after reset deactivation");
            $finish;
        end
        #10; // Wait for next clock cycle

        // Check reset_sync should be low after the pulse
        if (reset_sync !== 0) begin
            $display("FAIL: reset_sync should be low after the pulse");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule