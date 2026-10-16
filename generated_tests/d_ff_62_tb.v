`timescale 1ns/1ps

module tb_d_ff;

    reg in;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the D Flip-Flop
    d_ff uut (
        .in(in),
        .clk(clk),
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
        in = 0;
        rst = 1; // Assert reset
        #10; // Wait for 10ns
        rst = 0; // Deassert reset

        // Test case 1: Check reset functionality
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Check D Flip-Flop functionality
        in = 1; // Set input to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not follow in (expected 1)");
            $finish;
        end

        // Test case 3: Change input and check output
        in = 0; // Change input to 0
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not follow in (expected 0)");
            $finish;
        end

        // Test case 4: Check reset functionality again
        rst = 1; // Assert reset
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 5: Check D Flip-Flop functionality after reset
        rst = 0; // Deassert reset
        in = 1; // Set input to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not follow in (expected 1)");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule