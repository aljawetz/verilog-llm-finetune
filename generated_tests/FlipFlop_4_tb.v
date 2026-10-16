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
        rst = 0;
        d = 0;

        // Test sequence
        // Test 1: Reset functionality
        rst = 1; #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Set d to 1 and check q
        rst = 0; d = 1; #10;
        if (q !== 1) begin
            $display("FAIL: q did not update to d when clk rises");
            $finish;
        end

        // Test 3: Change d to 0 and check q
        d = 0; #10;
        if (q !== 0) begin
            $display("FAIL: q did not update to d when clk rises");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 5: Check behavior with multiple clock cycles
        rst = 0; d = 1; #10;
        if (q !== 1) begin
            $display("FAIL: q did not update to d when clk rises");
            $finish;
        end
        
        d = 0; #10;
        if (q !== 0) begin
            $display("FAIL: q did not update to d when clk rises");
            $finish;
        end

        // Final check: Reset again
        rst = 1; #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule