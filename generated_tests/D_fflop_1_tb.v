`timescale 1ns/1ps

module tb_D_fflop;

    reg D;
    reg clk;
    reg rst;
    wire Q;
    wire Qb;

    // Instantiate the D flip-flop
    D_fflop uut (
        .D(D),
        .clk(clk),
        .rst(rst),
        .Q(Q),
        .Qb(Qb)
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
        rst = 0;

        // Test 1: Reset the flip-flop
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (Q !== 0 || Qb !== 1) begin
            $display("FAIL: Reset did not set Q to 0 and Qb to 1");
            $finish;
        end

        // Test 2: Load D into Q
        rst = 0; // Deassert reset
        D = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1 || Qb !== 0) begin
            $display("FAIL: Q did not load D correctly");
            $finish;
        end

        // Test 3: Change D and check Q
        D = 0; // Change D to 0
        #10; // Wait for one clock cycle
        if (Q !== 0 || Qb !== 1) begin
            $display("FAIL: Q did not update correctly with new D");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (Q !== 0 || Qb !== 1) begin
            $display("FAIL: Reset did not set Q to 0 and Qb to 1 again");
            $finish;
        end

        // Test 5: Check behavior with reset deasserted
        rst = 0; // Deassert reset
        D = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1 || Qb !== 0) begin
            $display("FAIL: Q did not load D correctly after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule