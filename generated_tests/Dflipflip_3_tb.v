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
        reset = 1; // Assert reset
        #10; // Wait for 10ns
        reset = 0; // Deassert reset

        // Test case 1: Check reset behavior
        if (Q !== 0 || Qb !== 1) begin
            $display("FAIL: Reset did not set Q to 0 and Qb to 1");
            $finish;
        end

        // Test case 2: Check D input propagation
        D = 1; #10; // Set D to 1 and wait for clock edge
        if (Q !== 1 || Qb !== 0) begin
            $display("FAIL: D input did not propagate correctly");
            $finish;
        end

        // Test case 3: Check D input propagation with D = 0
        D = 0; #10; // Set D to 0 and wait for clock edge
        if (Q !== 0 || Qb !== 1) begin
            $display("FAIL: D input did not propagate correctly");
            $finish;
        end

        // Test case 4: Check reset behavior again
        reset = 1; #10; // Assert reset
        if (Q !== 0 || Qb !== 1) begin
            $display("FAIL: Reset did not set Q to 0 and Qb to 1");
            $finish;
        end

        // Test case 5: Check D input propagation after reset
        reset = 0; // Deassert reset
        D = 1; #10; // Set D to 1 and wait for clock edge
        if (Q !== 1 || Qb !== 0) begin
            $display("FAIL: D input did not propagate correctly after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule