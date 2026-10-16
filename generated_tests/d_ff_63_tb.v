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
        rst = 0;

        // Test 1: Reset the D Flip-Flop
        rst = 1; #10; // Assert reset
        rst = 0; #10; // Deassert reset
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Check D Flip-Flop behavior
        in = 1; #10; // Set input to 1
        if (q !== 1) begin
            $display("FAIL: q did not update to 1 when in is 1");
            $finish;
        end

        // Test 3: Change input and check output
        in = 0; #10; // Change input to 0
        if (q !== 0) begin
            $display("FAIL: q did not update to 0 when in is 0");
            $finish;
        end

        // Test 4: Check behavior with multiple clock cycles
        in = 1; #10; // Set input to 1
        if (q !== 1) begin
            $display("FAIL: q did not update to 1 after clock with in = 1");
            $finish;
        end

        in = 0; #10; // Set input to 0
        if (q !== 0) begin
            $display("FAIL: q did not update to 0 after clock with in = 0");
            $finish;
        end

        // Test 5: Assert reset again
        rst = 1; #10; // Assert reset
        rst = 0; #10; // Deassert reset
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 on second reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule