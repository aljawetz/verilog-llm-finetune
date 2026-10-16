`timescale 1ns/1ps

module tb_dff;

    reg din;
    reg clk;
    reg rst;
    wire qout;
    wire qbar;

    // Instantiate the D flip-flop module
    dff uut (
        .din(din),
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
        // Initialize inputs
        din = 0;
        rst = 0;

        // Test case 1: Reset functionality
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (qout !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set qout to 0 and qbar to 1");
            $finish;
        end

        // Test case 2: Normal operation
        rst = 0; // Deassert reset
        din = 1; // Set data input
        #10; // Wait for one clock cycle
        if (qout !== 1 || qbar !== 0) begin
            $display("FAIL: qout and qbar did not reflect din correctly");
            $finish;
        end

        // Test case 3: Change data input
        din = 0; // Change data input
        #10; // Wait for one clock cycle
        if (qout !== 0 || qbar !== 1) begin
            $display("FAIL: qout and qbar did not reflect din correctly after change");
            $finish;
        end

        // Test case 4: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (qout !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set qout to 0 and qbar to 1 again");
            $finish;
        end

        // Test case 5: Final check with reset deasserted
        rst = 0; // Deassert reset
        din = 1; // Set data input
        #10; // Wait for one clock cycle
        if (qout !== 1 || qbar !== 0) begin
            $display("FAIL: qout and qbar did not reflect din correctly after final change");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule