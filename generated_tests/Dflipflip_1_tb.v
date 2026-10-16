`timescale 1ns/1ps

module tb_Dflipflip;
    reg D;
    reg clk;
    reg reset;
    wire Q;
    wire Qb;

    // Instantiate the Dflipflip module
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
        reset = 1;
        D = 0;

        // Apply reset
        #10;
        reset = 0;

        // Test case 1: Check reset behavior
        if (Q !== 1'b0 || Qb !== 1'b1) begin
            $display("FAIL: Reset did not set Q to 0 and Qb to 1");
            $finish;
        end

        // Test case 2: Set D to 1
        D = 1;
        #10; // Wait for one clock cycle

        if (Q !== 1'b1 || Qb !== 1'b0) begin
            $display("FAIL: After setting D to 1, Q should be 1 and Qb should be 0");
            $finish;
        end

        // Test case 3: Set D to 0
        D = 0;
        #10; // Wait for one clock cycle

        if (Q !== 1'b0 || Qb !== 1'b1) begin
            $display("FAIL: After setting D to 0, Q should be 0 and Qb should be 1");
            $finish;
        end

        // Test case 4: Check behavior with reset during operation
        D = 1;
        #10; // Wait for one clock cycle
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle

        if (Q !== 1'b0 || Qb !== 1'b1) begin
            $display("FAIL: Reset during operation did not set Q to 0 and Qb to 1");
            $finish;
        end

        // Test case 5: Check behavior after reset
        reset = 0; // Deassert reset
        D = 1;
        #10; // Wait for one clock cycle

        if (Q !== 1'b1 || Qb !== 1'b0) begin
            $display("FAIL: After reset and setting D to 1, Q should be 1 and Qb should be 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule