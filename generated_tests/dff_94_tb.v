`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .q(q),
        .d(d),
        .clk(clk),
        .rst(rst)
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

        // Test 1: Check reset functionality
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Check data input functionality
        rst = 0; // Deassert reset
        d = 1; // Set data to 1
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: q did not update to d (1)");
            $finish;
        end

        // Test 3: Change data input
        d = 0; // Set data to 0
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: q did not update to d (0)");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test 5: Check data input after reset
        rst = 0; // Deassert reset
        d = 1; // Set data to 1
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: q did not update to d (1) after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule