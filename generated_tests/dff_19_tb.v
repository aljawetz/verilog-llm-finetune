`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the D flip-flop
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
        // Initialize
        rst = 1; d = 0;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test case 1: Check reset behavior
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test case 2: Check D flip-flop behavior
        d = 1; #10; // Set d to 1
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: After setting d to 1, q should be 1 and qbar should be 0");
            $finish;
        end

        d = 0; #10; // Set d to 0
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: After setting d to 0, q should be 0 and qbar should be 1");
            $finish;
        end

        // Test case 3: Check reset during operation
        rst = 1; #10; // Assert reset
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 during operation");
            $finish;
        end

        rst = 0; // Release reset
        d = 1; #10; // Set d to 1
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: After setting d to 1, q should be 1 and qbar should be 0 after reset");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule