`timescale 1ns/1ps

module tb_dff_sync;

    reg d;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the D flip-flop
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
        // Initialize signals
        d = 0;
        rst = 1; // Start with reset active
        #10;

        // Check reset functionality
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Set d to 1
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: q did not capture d when d=1");
            $finish;
        end

        // Test case 2: Set d to 0
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: q did not capture d when d=0");
            $finish;
        end

        // Test case 3: Assert reset again
        rst = 1;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 4: Release reset and check d=1
        rst = 0;
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: q did not capture d when d=1 after reset");
            $finish;
        end

        // Test case 5: Check d=0 again
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: q did not capture d when d=0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule