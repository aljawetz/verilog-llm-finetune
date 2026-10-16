`timescale 1ns/1ps

module tb_Dflipflip;

    reg D;
    reg clk;
    reg reset;
    wire Q;
    wire Qb;

    // Instantiate the D flip-flop module
    Dflipflip uut (
        .D(D),
        .Q(Q),
        .Qb(Qb),
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        D = 0;
        reset = 1;

        // Apply reset
        #10;
        reset = 0;

        // Test case 1: Check reset behavior
        if (Q !== 1'b0 || Qb !== 1'b1) begin
            $display("FAIL: Reset did not set Q to 0 and Qb to 1");
            $finish;
        end

        // Test case 2: Check D input propagation
        D = 1;
        #10; // Wait for one clock cycle
        if (Q !== 1'b1 || Qb !== 1'b0) begin
            $display("FAIL: D input did not propagate correctly");
            $finish;
        end

        // Test case 3: Change D input
        D = 0;
        #10; // Wait for one clock cycle
        if (Q !== 1'b0 || Qb !== 1'b1) begin
            $display("FAIL: D input change did not propagate correctly");
            $finish;
        end

        // Test case 4: Check behavior with multiple changes
        D = 1;
        #10; // Wait for one clock cycle
        D = 0;
        #10; // Wait for one clock cycle
        if (Q !== 1'b0 || Qb !== 1'b1) begin
            $display("FAIL: D input change did not propagate correctly after multiple changes");
            $finish;
        end

        // Test case 5: Check reset again
        reset = 1;
        #10; // Wait for one clock cycle
        reset = 0;
        if (Q !== 1'b0 || Qb !== 1'b1) begin
            $display("FAIL: Reset did not set Q to 0 and Qb to 1 on second check");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule