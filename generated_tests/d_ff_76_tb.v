`timescale 1ns/1ps

module tb_d_ff;

    reg clk;
    reg reset;
    reg d;
    wire q;
    wire qb;

    // Instantiate the D Flip-Flop
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

        // Apply reset
        #10;
        reset = 0;

        // Test case 1: Check reset functionality
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end

        // Test case 2: Check D input propagation
        d = 1; #10; // Wait for one clock cycle
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: D input did not propagate correctly");
            $finish;
        end

        // Test case 3: Check D input propagation with reset
        reset = 1; #10; // Apply reset
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end

        reset = 0; // Release reset
        d = 0; #10; // Wait for one clock cycle
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: D input did not propagate correctly after reset");
            $finish;
        end

        // Test case 4: Check D input propagation with changing D
        d = 1; #10; // Wait for one clock cycle
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: D input did not propagate correctly");
            $finish;
        end

        d = 0; #10; // Wait for one clock cycle
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: D input did not propagate correctly");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule