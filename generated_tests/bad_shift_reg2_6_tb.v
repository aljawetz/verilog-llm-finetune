`timescale 1ns/1ps

module tb_bad_shift_reg2;
    reg clk;
    reg reset;
    reg d;
    wire dout;

    // Instantiate the module under test
    bad_shift_reg2 uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .dout(dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Check dout after first input
        d = 1; // Set input
        #10; // Wait for one clock cycle
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after reset");
            $finish;
        end

        // Test case 2: Check dout after second input
        #10; // Wait for another clock cycle
        if (dout !== 1) begin
            $display("FAIL: dout should be 1 after first shift");
            $finish;
        end

        // Test case 3: Check dout after third input
        d = 0; // Change input
        #10; // Wait for another clock cycle
        if (dout !== 1) begin
            $display("FAIL: dout should still be 1 after second shift");
            $finish;
        end

        // Test case 4: Check dout after fourth input
        #10; // Wait for another clock cycle
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after third shift");
            $finish;
        end

        // Test case 5: Reset the module
        reset = 1; // Assert reset
        #10; // Wait for reset to take effect
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after reset");
            $finish;
        end

        // Test case 6: Check dout after reset and new input
        reset = 0; // Release reset
        d = 1; // Set input
        #10; // Wait for one clock cycle
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after reset and before first shift");
            $finish;
        end

        // Final check
        #10; // Wait for another clock cycle
        if (dout !== 1) begin
            $display("FAIL: dout should be 1 after first shift post-reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule