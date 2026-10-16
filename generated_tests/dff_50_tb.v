`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg rst;
    wire qout;
    wire qbar;

    // Instantiate the D flip-flop module
    dff uut (
        .d(d),
        .clk(clk),
        .rst(rst),
        .qout(qout),
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
        rst = 0;

        // Test 1: Reset functionality
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (qout !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Reset did not set qout to 0 and qbar to 1");
            $finish;
        end

        // Test 2: Check D flip-flop behavior
        rst = 0; // Deassert reset
        d = 1; // Set D input
        #10; // Wait for one clock cycle
        if (qout !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: D flip-flop did not set qout to 1 and qbar to 0");
            $finish;
        end

        // Test 3: Change D input
        d = 0; // Change D input
        #10; // Wait for one clock cycle
        if (qout !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: D flip-flop did not set qout to 0 and qbar to 1 after D changed to 0");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (qout !== 1'b0 || qbar !== 1'b1) begin
            $display("FAIL: Reset did not set qout to 0 and qbar to 1 again");
            $finish;
        end

        // Test 5: Final check with D = 1
        rst = 0; // Deassert reset
        d = 1; // Set D input
        #10; // Wait for one clock cycle
        if (qout !== 1'b1 || qbar !== 1'b0) begin
            $display("FAIL: D flip-flop did not set qout to 1 and qbar to 0 on final check");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule