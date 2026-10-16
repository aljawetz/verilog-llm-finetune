`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg reset;
    wire q;
    wire qbar;

    // Instantiate the D flip-flop module
    dff uut (
        .d(d),
        .clk(clk),
        .reset(reset),
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
        d = 0;
        reset = 0;

        // Test reset functionality
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        reset = 0; // Deassert reset
        #10; // Wait for a clock edge

        // Test capturing d = 1
        d = 1;
        #10; // Wait for a clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: After d = 1, q should be 1 and qbar should be 0");
            $finish;
        end

        // Test capturing d = 0
        d = 0;
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: After d = 0, q should be 0 and qbar should be 1");
            $finish;
        end

        // Test reset functionality again
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 on second check");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule