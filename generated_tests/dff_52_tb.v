`timescale 1ns/1ps

module tb_dff;
    reg clk;
    reg rst;
    reg d;
    wire d_q;

    // Instantiate the D flip-flop
    dff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .d_q(d_q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        d = 0;

        // Apply reset
        #3;
        rst = 0; // Deassert reset
        #10;

        // Test case 1: Check output after reset
        if (d_q !== 0) begin
            $display("FAIL: Output should be 0 after reset");
            $finish;
        end

        // Test case 2: Set d to 1 and check output
        d = 1;
        #10; // Wait for one clock cycle
        if (d_q !== 1) begin
            $display("FAIL: Output should be 1 after clock with d=1");
            $finish;
        end

        // Test case 3: Set d to 0 and check output
        d = 0;
        #10; // Wait for one clock cycle
        if (d_q !== 0) begin
            $display("FAIL: Output should be 0 after clock with d=0");
            $finish;
        end

        // Test case 4: Assert reset again
        rst = 1; // Assert reset
        #3;
        rst = 0; // Deassert reset
        #10;

        // Final check: Output should be 0 after reset
        if (d_q !== 0) begin
            $display("FAIL: Output should be 0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule