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
        // Initialize signals
        d = 0;
        rst = 0;

        // Test 1: Reset the flip-flop
        rst = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 2: Set d to 1 and clock
        rst = 0; // Deactivate reset
        d = 1; // Set data input
        #10; // Wait for one clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q should be 1 and qbar should be 0 when d is 1");
            $finish;
        end

        // Test 3: Set d to 0 and clock
        d = 0; // Change data input
        #10; // Wait for one clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q should be 0 and qbar should be 1 when d is 0");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
            $finish;
        end

        // Test 5: Check behavior after reset
        rst = 0; // Deactivate reset
        d = 1; // Set data input
        #10; // Wait for one clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q should be 1 and qbar should be 0 after reset is deactivated");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule