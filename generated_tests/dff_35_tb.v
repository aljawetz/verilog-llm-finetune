`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg rst;
    reg d;
    wire qb;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .clk(clk),
        .rst(rst),
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
        rst = 1; // Start with reset active
        d = 0;

        // Wait for a clock edge
        #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Release reset
        rst = 0;
        #10;

        // Test setting d = 1
        d = 1;
        #10;
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: q should be 1 when d is 1 and reset is inactive");
            $finish;
        end

        // Test setting d = 0
        d = 0;
        #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: q should be 0 when d is 0 and reset is inactive");
            $finish;
        end

        // Test reset active again
        rst = 1;
        #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: q should be 0 when reset is active");
            $finish;
        end

        // Release reset and set d = 1
        rst = 0;
        d = 1;
        #10;
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: q should be 1 when d is 1 and reset is inactive");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule