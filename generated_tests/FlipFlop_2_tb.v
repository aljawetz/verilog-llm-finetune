`timescale 1ns/1ps

module testbench;
    reg slowclk;
    reg clk;
    reg rst;
    reg d;
    wire q;

    // Instantiate the FlipFlop module
    FlipFlop uut (
        .slowclk(slowclk),
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    initial begin
        slowclk = 0;
        forever #20 slowclk = ~slowclk; // 40ns period
    end

    initial begin
        // Initialize signals
        rst = 1;
        d = 0;

        // Wait for a few clock cycles
        #15;
        rst = 0; // Release reset

        // Test case 1: Check reset functionality
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Check data input functionality
        d = 1; // Set d to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to d when d is 1");
            $finish;
        end

        // Test case 3: Check data input functionality with d = 0
        d = 0; // Set d to 0
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not update to d when d is 0");
            $finish;
        end

        // Test case 4: Check reset functionality again
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test case 5: Check that q does not change when reset is asserted
        d = 1; // Set d to 1
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q changed while reset is asserted");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule