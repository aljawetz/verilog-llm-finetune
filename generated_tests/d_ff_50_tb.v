`timescale 1ns/1ps

module tb_d_ff;

    // Inputs
    reg clk;
    reg d;
    reg rst;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    d_ff uut (
        .clk(clk),
        .d(d),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1; d = 0;
        #10; // Wait for 10ns

        // Test reset functionality
        if (q !== 0) begin
            $display("FAIL: q should be 0 after reset");
            $finish;
        end

        // Release reset
        rst = 0;
        #10; // Wait for 10ns

        // Test D flip-flop functionality
        d = 1; #10; // Set d to 1
        if (q !== 1) begin
            $display("FAIL: q should be 1 when d is 1");
            $finish;
        end

        d = 0; #10; // Set d to 0
        if (q !== 0) begin
            $display("FAIL: q should be 0 when d is 0");
            $finish;
        end

        // Test reset functionality again
        rst = 1; #10; // Assert reset
        if (q !== 0) begin
            $display("FAIL: q should be 0 after reset");
            $finish;
        end

        // Release reset and test again
        rst = 0; #10; // Wait for 10ns
        d = 1; #10; // Set d to 1
        if (q !== 1) begin
            $display("FAIL: q should be 1 when d is 1");
            $finish;
        end

        // Final check
        d = 0; #10; // Set d to 0
        if (q !== 0) begin
            $display("FAIL: q should be 0 when d is 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule