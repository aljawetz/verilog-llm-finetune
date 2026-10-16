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
        d = 0;
        rst = 0;

        // Test 1: Reset functionality
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 2: Check data input when not reset
        rst = 0; // Deassert reset
        d = 1; // Set data input
        #10; // Wait for one clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Data input did not set q to 1 and qbar to 0");
            $finish;
        end

        // Test 3: Change data input
        d = 0; // Change data input
        #10; // Wait for one clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Data input did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 5: Check data input after reset
        rst = 0; // Deassert reset
        d = 1; // Set data input
        #10; // Wait for one clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Data input did not set q to 1 and qbar to 0");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule