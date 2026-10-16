`timescale 1ns/1ps

module tb_latch;

    reg clk;
    reg in;
    wire out;

    // Instantiate the module under test (uut)
    latch uut (
        .clk(clk),
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
        // Initialize inputs
        in = 0;

        // Wait for a clock cycle
        #10;

        // Test case 1: Capture input when clk is low
        in = 1; // Set input to 1
        #5;     // Wait for clk to be low
        if (out !== 1) begin
            $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 2: Hold value when clk is high
        #10;    // Wait for clk to be high
        if (out !== 1) begin
            $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 3: Change input when clk is low
        #5;     // Wait for clk to be low
        in = 0; // Change input to 0
        #5;     // Wait for clk to be low
        if (out !== 0) begin
            $display("FAIL: Test case 3 failed, expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 4: Hold value when clk is high
        #10;    // Wait for clk to be high
        if (out !== 0) begin
            $display("FAIL: Test case 4 failed, expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 5: Capture new input when clk is low
        #5;     // Wait for clk to be low
        in = 1; // Set input to 1
        #5;     // Wait for clk to be low
        if (out !== 1) begin
            $display("FAIL: Test case 5 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule