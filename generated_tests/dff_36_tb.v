`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg rst;
    reg d;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; // Start with reset active
        d = 0;

        // Wait for a clock cycle
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Output should be 0 when reset is active");
            $finish;
        end

        // Release reset
        rst = 0;
        #10;

        // Test 1: Set d to 1 and check output
        d = 1;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: Output should be 1 after setting d to 1");
            $finish;
        end

        // Test 2: Set d to 0 and check output
        d = 0;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Output should be 0 after setting d to 0");
            $finish;
        end

        // Test 3: Assert reset again
        rst = 1;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Output should be 0 when reset is active again");
            $finish;
        end

        // Test 4: Release reset and set d to 1
        rst = 0;
        d = 1;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: Output should be 1 after setting d to 1 again");
            $finish;
        end

        // Test 5: Check output on multiple clock cycles
        d = 0;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Output should be 0 after setting d to 0 again");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule