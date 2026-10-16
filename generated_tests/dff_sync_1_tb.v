`timescale 1ns/1ps

module tb_dff_sync;

    reg d;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the DFF module
    dff_sync uut (
        .d(d),
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
        // Initialize inputs
        d = 0;
        rst = 1;

        // Test 1: Reset behavior
        #10; // Wait for a clock cycle
        rst = 0; // Release reset
        d = 1; // Set d to 1
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q to be 1 after d=1 and rst=0");
            $finish;
        end

        // Test 2: Check reset functionality
        #10; // Wait for a clock cycle
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q to be 0 after reset");
            $finish;
        end

        // Test 3: Check d input with reset inactive
        rst = 0; // Release reset
        d = 0; // Set d to 0
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q to be 0 after d=0 and rst=0");
            $finish;
        end

        d = 1; // Set d to 1
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q to be 1 after d=1 and rst=0");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q to be 0 after reset");
            $finish;
        end

        // Test 5: Final check with d=0
        rst = 0; // Release reset
        d = 0; // Set d to 0
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q to be 0 after d=0 and rst=0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule