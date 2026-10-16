`timescale 1ns/1ps

module tb_d_ff;

    reg clk;
    reg reset;
    reg d;
    wire q;
    wire qb;

    // Instantiate the D flip-flop
    d_ff uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q),
        .qb(qb)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Check reset functionality
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end

        // Test case 2: Check D input propagation
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: D input did not propagate correctly");
            $finish;
        end

        // Test case 3: Check D input change
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: D input change did not propagate correctly");
            $finish;
        end

        // Test case 4: Check asynchronous reset during operation
        d = 1;
        #5; // Wait for half a clock cycle
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Reset did not work during operation");
            $finish;
        end

        // Test case 5: Check normal operation after reset
        reset = 0;
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: D input did not propagate correctly after reset");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule