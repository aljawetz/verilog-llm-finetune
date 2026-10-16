`timescale 1ns/1ps

module tb_FlipFlop;

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
        // Initialize inputs
        rst = 1; // Start with reset active
        d = 0;

        // Wait for a few clock cycles
        #15;
        rst = 0; // Deactivate reset

        // Test case 1: Check reset functionality
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Set d to 1 and check q
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to d when d is 1");
            $finish;
        end

        // Test case 3: Set d to 0 and check q
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not update to d when d is 0");
            $finish;
        end

        // Test case 4: Assert reset functionality again
        rst = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test case 5: Check behavior with multiple clock edges
        rst = 0; // Deactivate reset
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to d when d is 1 after reset");
            $finish;
        end

        // Final check
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not update to d when d is 0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule