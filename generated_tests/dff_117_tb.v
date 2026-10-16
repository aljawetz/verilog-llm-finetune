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
        // Initialize inputs
        rst = 1; // Assert reset
        d = 0;

        // Wait for a clock cycle
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Release reset
        rst = 0;

        // Test case 1: Set d = 1
        d = 1;
        #10; // Wait for a clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: After setting d=1, q should be 1 and qbar should be 0");
            $finish;
        end

        // Test case 2: Set d = 0
        d = 0;
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: After setting d=0, q should be 0 and qbar should be 1");
            $finish;
        end

        // Test case 3: Assert reset again
        rst = 1;
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
            $finish;
        end

        // Test case 4: Release reset and set d = 1
        rst = 0;
        d = 1;
        #10; // Wait for a clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: After setting d=1 again, q should be 1 and qbar should be 0");
            $finish;
        end

        // Test case 5: Set d = 0
        d = 0;
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: After setting d=0 again, q should be 0 and qbar should be 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule