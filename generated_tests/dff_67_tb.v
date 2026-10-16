`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the D Flip-Flop
    dff uut (
        .d(d),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; // Assert reset
        d = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Check reset functionality
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test case 2: Check D flip-flop behavior
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: D flip-flop did not set q to 1 and qbar to 0");
            $finish;
        end

        // Test case 3: Change D to 0
        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: D flip-flop did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test case 4: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule